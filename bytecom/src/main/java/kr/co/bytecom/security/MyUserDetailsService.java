package kr.co.bytecom.security;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import kr.co.bytecom.user.dao.UserDao;
import kr.co.bytecom.user.dto.UserDto;


public class MyUserDetailsService implements UserDetailsService {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public UserDetails loadUserByUsername(String userId) throws UsernameNotFoundException {

		
		
		UserDao userDao = sqlSession.getMapper(UserDao.class);		
		UserDto userDto = userDao.getUserData(userId);
		
		if(userDto==null) {
			return null;
		}		
		
		
		return userDto;
	}

}
