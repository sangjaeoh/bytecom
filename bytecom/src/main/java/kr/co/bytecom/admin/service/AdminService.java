package kr.co.bytecom.admin.service;

import java.util.List;
import java.util.Map;

import kr.co.bytecom.admin.dto.AdminListDto;

public interface AdminService {
	public int registerGroupUser(Map<String,Object> map) throws Exception;  //그룹계정유저추가
	public int registerGroupRtk (Map<String,Object> map); //그룹계정RTK추가
	public int groupCodeCheck(String string); //그룹코드 중복확인
	public List<Map<String,Object>> getGroupInfo(Map<String,Object> map);//그룹수정삭제 페이지 이동 정보
	
	public int updateGroupUser(Map<String,Object> map); //그룹계정 update
	public int updateGroupRtk(Map<String,Object> map); //그룹계정RTK update
	public int updateGroupTable(Map<String,Object> map); //그룹Table update
	public int getCheckGroupRtk(Map<String,Object> map); //해당그룹에 RTK계정이 있는지 확인
	
	
	public int registerUser (Map<String,Object> map); //일반계정유저추가
	public Map<String,Object> getUserInfo(Map<String,Object> map);//유저수정삭제 페이지 이동 정보
	public int updateUser (Map<String,Object> map); //일반계정유저 update
	
	public List<AdminListDto> getGroupList(Map<String,Object> map); //그룹목록가져오기
	public List<AdminListDto> getUserList(Map<String,Object> map); //유저목록가져오기
	public List<Map<String,Object>> getGroupNameList(); //그룹네임,기관코드 리스트
}
