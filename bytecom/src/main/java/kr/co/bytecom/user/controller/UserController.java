package kr.co.bytecom.user.controller;



import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
		
    
	//예약하기 페이지 이동
	@RequestMapping( value = "/user/booking/add", method = RequestMethod.GET)
    public String mvGroupBooking() {	
		
		return "/user/bookingadd";
	}
	
	//예약하기 페이지 달력 PLAN_ID 데이터 생성
	@RequestMapping( value = "/user/booking/getCalendar", method = RequestMethod.POST)
    public @ResponseBody Map<String,Object> getCalendarData(@RequestBody Map<String,Object> map) {	
		
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();			
		Map<String,Object> returnMap = new HashMap<String, Object>();	
		list = userService.getCalendarData(map);
		returnMap.put("calendarData", list);
		
		return returnMap;
	}
    
	//유저 예약가능상품 알아오기
	@RequestMapping( value = "/user/booking/getGoods", method = RequestMethod.GET)
    public @ResponseBody List getGoods(@RequestParam Map<String,Object> map) {
		
		List<String> list = new ArrayList<String>();
		list = userService.getGoods(map);
		return list;
	}
    
	//유저 상품예약 등록
	@RequestMapping(value = "/user/booking/register", method = RequestMethod.POST, headers= {"Content-type=application/json"})
    public @ResponseBody int registerBooking(@RequestBody Map<String,Object> map, HttpServletRequest request) {
		//세션에서 로그인정보 구해와서 userid groupcode 
		map.put("userId", "페페");
		map.put("groupCode", "처음");
		
		int check = 0;
		check = userService.registerBooking(map);		
		return check;
	}
	
	
	

}
