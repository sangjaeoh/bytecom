package kr.co.bytecom.user.dto;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
public class UserDto implements UserDetails {

	private String userId;
	private String userPw;
	private String userName;
	private String userMail;
	private String userMailAuthcode;
	private String userPhone;
	private String userCompany;
	private String groupCode;
	private String groupName;
	private String authCode;
	private String stateCode;
	private String insUser;
	private String insDate;
	private String updUser;
	private String updDate;
	
	private String json;
	
	
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() { //계정이 갖고있는 권한 목록을 리턴한다.
		 ArrayList<GrantedAuthority> auth = new ArrayList<GrantedAuthority>();
	        auth.add(new SimpleGrantedAuthority(authCode));        
	        
		return auth;
	}
	
	@Override
	public String getPassword() { //계정의 비밀번호를 리턴한다.
		return userPw;
	}
	@Override
	public String getUsername() { //계정의 이름을 리턴한다.
		return userId;
	}
	@Override
	public boolean isAccountNonExpired() {//계정이 만료되지 않았는 지 리턴한다. (true: 만료안됨)
		return true;
	}
	@Override
	public boolean isAccountNonLocked() {//계정이 잠겨있지 않았는 지 리턴한다. (true: 잠기지 않음)
		return true;
	}
	@Override
	public boolean isCredentialsNonExpired() { //비밀번호가 만료되지 않았는지 리턴한다. (true: 만료안됨)

		return true;
	}
	@Override
	public boolean isEnabled() { //계정이 활성화(사용가능)인지 리턴한다.(true: 활성화)//stateCode불러와서 코딩하자		
		
		return true;
	}
}
