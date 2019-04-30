package kr.co.bytecom.user.controller;



import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.bytecom.user.dto.UserDto;
import kr.co.bytecom.user.service.UserService;

@Controller
public class UserController {
	
	@Autowired
	private UserService userService;
	
	
	//회원등록
	@RequestMapping(value="/register/user",method=RequestMethod.POST, headers= {"Content-type=application/json"})
    public @ResponseBody Map<String, Object> userRegister(@RequestBody UserDto userDto, RedirectAttributes rttr) throws Exception {
		
		Map<String,Object> map = new HashMap<String, Object>();
		
		userService.registerUser(userDto);	
		
		rttr.addFlashAttribute("msg" , "가입시 사용한 이메일로 인증해주세요");		
        return map;
    }
	
	
	
	
	//이메일 인증 코드 검증
    @RequestMapping(value = "/register/emailConfirm", method = RequestMethod.GET)
    public String emailConfirm(UserDto userDto, RedirectAttributes rttr) throws Exception {
    	
    	System.out.println(userDto.getUserMail() + "\n" + userDto.getUserMailAuthcode());
    	
        int check = userService.userAuth(userDto);
        
        if(check == 0) {
            rttr.addFlashAttribute("msg" , "비정상적인 접근 입니다. 다시 인증해 주세요");
            return "redirect:/";
        }
       
        return "redirect:/";
    }
    
    //아이디 중복체크
    @RequestMapping(value="/register/userIdCheck",method=RequestMethod.POST)
    public @ResponseBody Map<String, Object> userIdCheck(@RequestBody String userId) throws Exception {

    	int check = 0;
		Map<String,Object> map = new HashMap<String, Object>();
		
		check = userService.userIdCheck(userId);		
		map.put("check", check);
		System.out.println(check);
        return map;
    }
    
    
    //Email 중복체크
    @RequestMapping(value="/register/userMailCheck",method=RequestMethod.POST)
    public @ResponseBody Map<String, Object> userMailCheck(@RequestBody String userMail) throws Exception {
		System.out.println("asdfasdf");
		System.out.println(userMail);
		
    	int check = 0;
		Map<String,Object> map = new HashMap<String, Object>();
		
		check = userService.userMailCheck(userMail);
		
		map.put("check", check);
        return map;
    }
		
    
    

}
