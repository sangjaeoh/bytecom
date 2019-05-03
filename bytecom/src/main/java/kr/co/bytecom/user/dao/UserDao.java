package kr.co.bytecom.user.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import kr.co.bytecom.user.dto.UserDto;

@Repository
public interface UserDao {
	
	//회원등록
	public void registerUser(UserDto userDto);
	
	//해당 email에 인증 키 업데이트
    public void createAuthKey(UserDto userDto);
	
	//이메일 인증 코드 확인
    public int chkAuth(UserDto userDto);    
	
 	//인증 후 계정 활성화
    public void userAuth(UserDto userDto);
    
    //아이디 중복 확인
    public int userIdCheck(String userId);
    
	//email 중복 확인    
    public int userMailCheck(String userMail);
   
    
    //회원 유무 확인
    public UserDto getUserData(String userId);
    
    public int checkBookingList(Map<String,Object>map);//예약하기 페이지가기전 한달내에 예약했는지 검사
    public List<String> getGoods(Map<String,Object> map); //유저 예약가능 상품 알아오기
    public int registerBooking (Map<String,Object> map);//유저 예약등록
}
