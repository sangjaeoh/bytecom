package kr.co.bytecom.user.service;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

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
	



	

}
