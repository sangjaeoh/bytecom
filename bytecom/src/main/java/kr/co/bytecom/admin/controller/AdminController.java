package kr.co.bytecom.admin.controller;

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

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import kr.co.bytecom.admin.dto.AdminListDto;
import kr.co.bytecom.admin.service.AdminService;
import kr.co.bytecom.service.CommonService;
import kr.co.bytecom.util.Pagination;

@Controller
public class AdminController {
	
	
	@Autowired
	private AdminService adminservice;
	
	@Autowired
	private CommonService commonService;
	
	//그룹추가페이지 이동
	@RequestMapping( value = "/admin/group/add", method = RequestMethod.GET)
    public String mvGroupAdd() {		
		
		return "/admin/groupadd";
	}
	
	//그룹 수정삭제 페이지 이동	
	@RequestMapping( value = "admin/group/updateDelete", method = RequestMethod.GET)
    public String mvGroupUpdateDelete(@RequestParam Map<String,Object> map,  HttpServletRequest request) {
		List<Map<String,Object>> list = adminservice.getGroupInfo(map);		
		request.setAttribute("groupInfo", list);		
		return "/admin/groupupdatedelete";
	}
	
	//유저추가페이지 이동
	@RequestMapping( value = "/admin/user/add", method = RequestMethod.GET)
    public String mvUserAdd(HttpServletRequest request) {		
		
		//그룹네임,기관코드 리스트
		List<Map<String, Object>> list = adminservice.getGroupNameList();
		request.setAttribute("groupList", list);
		return "/admin/useradd";
	}
	
	//유저 수정삭제 페이지 이동
	@RequestMapping( value = "admin/user/updateDelete", method = RequestMethod.GET)
    public String mvUserUpdateDelete(@RequestParam Map<String,Object> map,  HttpServletRequest request) {
		Map<String,Object> userInfo = adminservice.getUserInfo(map);		
		request.setAttribute("userInfo", userInfo);		
		return "/admin/userupdatedelete";
	}
	

	
	
	//그룹계정 user 추가  
	@RequestMapping( value = "/admin/group/userAdd", method = RequestMethod.POST)
    public String groupResigterUser(@RequestParam Map<String,Object> map)throws Exception {
		
		//그룹user추가
		int check = 0;
		check = adminservice.registerGroupUser(map);		
		System.out.println(check);
		if (check == 0) {
			return "redirect:/";
		}
		
		//RTK추가
		if(map.get("rtkList")!=null) {
		
		ObjectMapper mapper = new ObjectMapper();
		String json = (String) map.get("rtkList");
		List<Map<String, Object>> list = mapper.readValue(json, new TypeReference<List<Map<String, String>>>(){});
		for(Map<String,Object> k : list) {
			Map<String,Object> rtkMap = new HashMap<String, Object>();
			
			String planId = (String) k.get("planId");
			String rtkId = (String) k.get("rtkId");
			String rtkPw = (String) k.get("rtkPw");
			
			rtkMap.put("groupName", map.get("groupName"));
			rtkMap.put("planId", planId);
			rtkMap.put("rtkId", rtkId);
			rtkMap.put("rtkPw", rtkPw);			
			adminservice.registerGroupRtk(rtkMap);			
		}
		
		}
		
		return "redirect:/";
	}
	
	
	
	
	
	
	//그룹계정 update
		@RequestMapping( value = "/admin/group/update", method = RequestMethod.POST)
	    public String groupUpdateUser(@RequestParam Map<String,Object> map)throws Exception {
			
			//그룹 user update
			int checkUser = adminservice.updateGroupUser(map);	
			
			if (checkUser == 0) {
				return "redirect:/";
			}
			//RTK update
			if(map.get("rtkList")!=null) {	
				ObjectMapper mapper = new ObjectMapper();
				String json = (String) map.get("rtkList");
				List<Map<String, Object>> list = mapper.readValue(json, new TypeReference<List<Map<String, String>>>(){});
				
				for(Map<String,Object> k : list) {
					Map<String,Object> rtkMap = new HashMap<String, Object>();
					
					String planId = (String) k.get("planId");
					String rtkId = (String) k.get("rtkId");
					String rtkPw = (String) k.get("rtkPw");
					String beforePlanId = (String) k.get("beforePlanId");
					
					rtkMap.put("groupName", map.get("groupName"));
					rtkMap.put("beforeGroupName", map.get("beforeGroupName"));
					rtkMap.put("beforePlanId", beforePlanId);
					rtkMap.put("planId", planId);
					rtkMap.put("rtkId", rtkId);
					rtkMap.put("rtkPw", rtkPw);
					
					System.out.println(rtkMap.get("beforeGroupName") +"   :   " +rtkMap.get("beforePlanId"));
										
					//해당그룹 RTK계정에 PLANID가 이미 있는지 체크
					int checkRtk = 0;
					if(beforePlanId!=null || !beforePlanId.equals("")) {
						checkRtk = adminservice.getCheckGroupRtk(rtkMap);
					}
					
					if(checkRtk > 0) {
					//해당 PLAN ID가 있으면 UPDATE					
					adminservice.updateGroupRtk(rtkMap);
					
					}else {
					//없으면 새로 등록한 것이니까 insert
					adminservice.registerGroupRtk(rtkMap);
					}
				}
		}
			//그룹테이블 update
			adminservice.updateGroupTable(map);
			return "redirect:/";
		}
		
		
		
		
		
		
	
	
	//그룹코드 중복 확인
    @RequestMapping(value="/admin/group/groupCodeCheck",method=RequestMethod.POST)
    public @ResponseBody Map<String, Object> userIdCheck(@RequestBody String groupCode) throws Exception {

    	int check = 0;
		Map<String,Object> map = new HashMap<String, Object>();
		
		check = adminservice.groupCodeCheck(groupCode);	
		System.out.println("groupcode" + check);
		map.put("check", check);
		
        return map;
    }
    
    
    //그룹목록 불러오기    
    @RequestMapping(value="/admin/group/list",method=RequestMethod.GET ,headers= {"Content-type=application/json"})	
	public @ResponseBody Map<String,Object> getGroupList(@RequestParam Map<String,Object> map, HttpServletRequest request) {
    	
    	String prefix = (String) map.get("prefix");
    	//목록 리스트     	
		List<AdminListDto> groupList = adminservice.getGroupList(map);
		map.put("groupList", groupList);
		//Pageination
		Pagination pagination = new Pagination();
		pagination = commonService.getpagination(map);
		pagination.setRoot(request.getContextPath());
		pagination.makeNavigator(prefix);
		map.put("pagination", pagination);	
		
		return map; 
	}
    
    //유저목록 불러오기    
    @RequestMapping(value="/admin/user/list",method=RequestMethod.GET ,headers= {"Content-type=application/json"})	
	public @ResponseBody Map<String,Object> getUserList(@RequestParam Map<String,Object> map, HttpServletRequest request) {
    	    	
    	//목록 리스트     	
		List<AdminListDto> userList = adminservice.getUserList(map);
		map.put("userList", userList);
		String prefix = (String) map.get("prefix");
		
		//Pageination
		Pagination pagination = new Pagination();
		pagination = commonService.getpagination(map);
		pagination.setRoot(request.getContextPath());
		pagination.makeNavigator(prefix);
		map.put("pagination", pagination);	
		
		return map; 
	}
    
  
    
    //일반 user 추가
    @RequestMapping( value = "/admin/user/userAdd", method = RequestMethod.POST)
    public String resigterUser(@RequestParam Map<String,Object> map)throws Exception {
		
		//일반user추가
		int check = 0;
		check = adminservice.registerUser(map);		
		if (check == 0) {
			return "redirect:/";
		}
		return "/admin/main";
	}
    //일반 user update
    @RequestMapping( value = "/admin/user/update", method = RequestMethod.POST)
    public String updateUser(@RequestParam Map<String,Object> map)throws Exception {
		
		//일반user추가
		int check = 0;
		check = adminservice.updateUser(map);		
		if (check == 0) {
			return "redirect:/";
		}
		return "/admin/main";
	}
    
    
}
