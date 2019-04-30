package kr.co.bytecom.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;

import kr.co.bytecom.user.dto.UserDto;


public class MyAuthenticationProvider implements AuthenticationProvider {

	@Autowired
	private MyUserDetailsService myUserDetailsService;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		
		//UserDetailsService에서 유저정보를 불러온다.
		UserDto userDto = (UserDto) myUserDetailsService.loadUserByUsername(authentication.getName());		
				
		String id = authentication.getPrincipal().toString();
		String password = authentication.getCredentials().toString();		
	
				
		//유저 정보 유무 확인
		if (userDto == null) {
		      throw new UsernameNotFoundException(id);
		    }
		
		//비밀번호 비교 확인
		if (!passwordEncoder.matches(password, userDto.getPassword())) {
			System.out.println("12312344444124214");
			throw new BadCredentialsException(password);			
		}
		userDto.setUserPw(null);
		
		
		System.out.println(userDto.toString());
		//계정 활성화 여부 확인
		 if(!userDto.isEnabled()) {
	            throw new BadCredentialsException(authentication.getName());
	        }
		 
		 
		 //객체에 화면에서 입력한 정보와 DB에서 가져온 권한을 담아서 리턴한다.
		return new UsernamePasswordAuthenticationToken(id, null, userDto.getAuthorities());		
		
	}

	@Override
	public boolean supports(Class<?> authentication) {		
		return authentication.equals(UsernamePasswordAuthenticationToken.class);
	}

}







//UserDto userDto = null;
//
//try {
//	
//	
//	userDto = (UserDto)myUserDetailsService.loadUserByUsername(authentication.getName());
//	
//
//	if(!passwordEncoder.matches( (CharSequence) authentication.getCredentials(), userDto.getPassword()))
//		throw new BadCredentialsException("비밀번호가 일치하지 않습니다.");
//	
//	authentication = (Authentication) userDto.getAuthorities();
//	
//} catch (UsernameNotFoundException e) {
//	
//	return null;
//} catch (BadCredentialsException e) {
//
//	throw new BadCredentialsException("비밀번호가 일치하지 않습니다. ex");
//	return null;
//} catch (Exception e ) {
//
//	e.printStackTrace();
//	return null;
//}
