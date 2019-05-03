package kr.co.bytecom.user.service;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Collection;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

import kr.co.bytecom.dao.BookingDao;
import kr.co.bytecom.mail.MailHandler;
import kr.co.bytecom.mail.TempKey;
import kr.co.bytecom.user.dao.UserDao;
import kr.co.bytecom.user.dto.UserDto;

@Component
public class UserServiceImpl implements UserService {

	@Autowired
	private SqlSession sqlSession;
	
	@Inject
	private JavaMailSender mailSender;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	//회원가입
	@Override	
	public void registerUser(UserDto userDto) throws Exception  {		
		
		UserDao userDao = sqlSession.getMapper(UserDao.class);
		
		String encPassword = passwordEncoder.encode(userDto.getUserPw()); //비밀번호 암호화
		userDto.setUserPw(encPassword);
		
		String key = new TempKey().getKey(50, false); // 인증키 생성
		
		MailHandler sendMail = new MailHandler(mailSender);
		sendMail.setSubject("[Bytecom 서비스 이메일 인증]");
		sendMail.setText(
		new StringBuffer().append("<h1>메일인증</h1>").append("<a href='http://localhost:8080/bytecom/register/emailConfirm?userMail=").append(userDto.getUserMail()).append("&UserMailAuthcode=").append(key).append("' target='_blenk'>이메일 인증 확인</a>").toString());
		sendMail.setFrom("bytecom@gmail.com", "bytecom");
		sendMail.setTo(userDto.getUserMail());
		sendMail.send();		
		
		
		userDao.registerUser(userDto);//회원가입 DAO
		userDto.setUserMailAuthcode(key); //DTO에 인증키 담기
		userDao.createAuthKey(userDto); // 인증키 DB저장
		
	}

	//이메일 인증후 계정 활성화
	@Override
	public int userAuth(UserDto userDto) {
		int check = 0;
		UserDao userDao = sqlSession.getMapper(UserDao.class);
		check = userDao.chkAuth(userDto);
		
		if(check!=0) {
			userDao.userAuth(userDto);			
		}
		
		return check;
	}

	
	//아이디 중복체크
	@Override
	public int userIdCheck(String userId) {
		UserDao userDao = sqlSession.getMapper(UserDao.class);
		
		return userDao.userIdCheck(userId);
	}

	
	//이메일 중복체크
	@Override
	public int userMailCheck(String userMail) {
		UserDao userDao = sqlSession.getMapper(UserDao.class);
		
		return userDao.userMailCheck(userMail);
	}

	
	
	//예약하기 페이지 달력 PLAN_ID 데이터 생성
	@Override
	public List<Map<String, Object>> getCalendarData(Map<String, Object> map) {
		
		BookingDao bookingDao = sqlSession.getMapper(BookingDao.class);
		
		//전체 planId 구하기
		List<String> getAllPlanIdList = new ArrayList<String>();		
		getAllPlanIdList = bookingDao.getAllPlanId(map);		
		
		//입력 날짜별 (디폴트 오늘)예약현황 구하기
		List<Map<String,Object>> getBookingPlanIdList = new ArrayList<Map<String,Object>>();
		getBookingPlanIdList = bookingDao.getBookingPlanIdList(map);		
		
		//리턴용 리스트
		List<Map<String,Object>> returnList = new ArrayList<Map<String,Object>>();
		
		//해당월의 시작일 끝일 구하기
		DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal = new GregorianCalendar();
		int year = Integer.parseInt(((String)map.get("calendarDate")).substring(0,4));
		int month = Integer.parseInt(((String)map.get("calendarDate")).substring(4,6));
		int day = Integer.parseInt(((String)map.get("calendarDate")).substring(6));
		cal.set(year, month-1, day);
		
		
		
		
		
		//예약된 목록 생성
		List<String> copyList = new ArrayList<String>();
		copyList.addAll(getAllPlanIdList);
		for(int i = 0; i<getAllPlanIdList.size(); i++) {			
			for(int j = 0; j<getBookingPlanIdList.size(); j++) {
				Map<String,Object> tempMap = new HashMap<String, Object>();					
				
				if(getAllPlanIdList.get(i).equals(getBookingPlanIdList.get(j).get("planId"))) {	
					
					try {
						//날짜 일별로 구하기
						if((getBookingPlanIdList.get(j).get("startDate")) != null) {
						Date startDate = sdf.parse((String) getBookingPlanIdList.get(j).get("startDate"));		
						Date endDate = sdf.parse((String) getBookingPlanIdList.get(j).get("endDate"));
						ArrayList<String> dates = new ArrayList<String>();
						Date currentDate = startDate;
						while (currentDate.compareTo(endDate) <= 0) {
							dates.add(sdf.format(currentDate));
							Calendar c = Calendar.getInstance();
							c.setTime(currentDate);
							c.add(Calendar.DAY_OF_MONTH, 1);
							currentDate = c.getTime();							
						}	
						tempMap.put("planId", getBookingPlanIdList.get(j).get("planId"));
						tempMap.put("state", getBookingPlanIdList.get(j).get("state"));
						tempMap.put("date", dates);
						}	
					} catch (ParseException e) {						
					}
					returnList.add(tempMap);
				}
				
			}		
			}
		
		//예약목록 제외한 전체목록 생성
		int returnListSize = returnList.size();
		for(int i=0; i<getAllPlanIdList.size(); i++){
			Map<String,Object> tempMap = new HashMap<String, Object>();
			String tempMonth = "";					
			if(month<10) {
				tempMonth = "0"+Integer.toString(month);
			}else {
				tempMonth = Integer.toString(month);
			}
			Date startDate;
			
			try {
				startDate = sdf.parse(year+"-"+tempMonth+"-"+cal.getMinimum(Calendar.DAY_OF_MONTH));
				Date endDate = sdf.parse(year+"-"+tempMonth+"-"+cal.getActualMaximum(Calendar.DAY_OF_MONTH));
				ArrayList<String> dates = new ArrayList<String>();
				Date currentDate = startDate;
				while (currentDate.compareTo(endDate) <= 0) {
					
					for(int a=0; a<returnListSize; a++) {
						if(returnList.get(a).get("planId").equals(getAllPlanIdList.get(i))) {
							String[] array = (returnList.get(a).get("date").toString().replaceAll("[\\t\\s]","").replaceAll("\\[", "").replaceAll("\\]", "").split(","));
						
							for(int n =0; n< array.length; n++) {
								if(array[n].equals(sdf.format(currentDate))){
									Calendar c = Calendar.getInstance();
									c.setTime(currentDate);
									c.add(Calendar.DAY_OF_MONTH, 1);
									currentDate = c.getTime();	
								}		
							}
						}
					}
					dates.add(sdf.format(currentDate));
					Calendar c = Calendar.getInstance();
					c.setTime(currentDate);
					c.add(Calendar.DAY_OF_MONTH, 1);
					currentDate = c.getTime();
				}
				tempMap.put("planId", getAllPlanIdList.get(i));
				tempMap.put("state", "A");
				tempMap.put("date", dates);
			} catch (ParseException e) {
				e.printStackTrace();
			}
			returnList.add(tempMap);			
		}
		return returnList;
	}

	//유저 예약가능상품 알아오기
	@Override
	public List<String> getGoods(Map<String, Object> map) {
		UserDao userDao = sqlSession.getMapper(UserDao.class);
		DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		try {
		Date startDate = sdf.parse((String)map.get("startDate"));
		Date endDate = sdf.parse((String)map.get("endDate"));
		ArrayList<String> dates = new ArrayList<String>();
		Date currentDate = startDate;
		while (currentDate.compareTo(endDate) <= 0) {
			dates.add(sdf.format(currentDate));
			Calendar c = Calendar.getInstance();
			c.setTime(currentDate);
			c.add(Calendar.DAY_OF_MONTH, 1);
			currentDate = c.getTime();		
		}
		String temp = dates.toString();		
		temp = temp.replaceAll("[\\t\\s]","").replaceAll("\\[", "'").replaceAll("\\]", "'").replaceAll(",", "','");
		map.put("date", temp);
		}catch (Exception e) {	
			
		}		 
		
		
		
		return userDao.getGoods(map);
	}

	//유저 예약등록
	@Override
	public int registerBooking(Map<String, Object> map) {
		UserDao userDao = sqlSession.getMapper(UserDao.class);
		
		//여기서 코딩 예약 시작일과 말일을 맵에서 빼서 해당달에 예약을 했는지 카운트 해서
		//있으면 리턴
		return userDao.registerBooking(map);
	}

	
	
}





