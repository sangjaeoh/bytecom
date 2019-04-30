package kr.co.bytecom.group.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.bytecom.group.service.GroupService;

@Controller
public class GroupController {
	

	
	//그룹추가페이지 이동
	@RequestMapping( value = "/group/booking", method = RequestMethod.GET)
    public String mvGroupBooking() {		
		
		return "/group/booking";
	}
}
