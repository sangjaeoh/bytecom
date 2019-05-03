package kr.co.bytecom.user.service;

import java.util.List;
import java.util.Map;

import kr.co.bytecom.user.dto.UserDto;

public interface UserService {

	public void registerUser(UserDto userDto) throws Exception;  //회원가입
	public int userAuth(UserDto userDto);//메일 인증 확인 후  사용자계정 활성화
	public int userIdCheck(String userId);//아이디 중복 체크
	public int userMailCheck(String userMail);//Email 중복 체크
	
	public List<Map<String,Object>> getCalendarData(Map<String,Object> map);//예약하기 페이지 달력 PLAN_ID 데이터 생성	
	public List<String> getGoods(Map<String,Object> map);//유저 예약가능상품 알아오기
	public int registerBooking (Map<String,Object> map);//유저 예약등록
	
}
