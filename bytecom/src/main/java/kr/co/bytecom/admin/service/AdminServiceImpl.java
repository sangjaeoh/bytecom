package kr.co.bytecom.admin.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

import kr.co.bytecom.admin.dao.AdminDao;
import kr.co.bytecom.admin.dto.AdminListDto;
import kr.co.bytecom.util.Constance;
import kr.co.bytecom.util.myValidator;


@Component
public class AdminServiceImpl implements AdminService {

	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private PasswordEncoder passwordEncoder;	
	
	
	
	//그룹계정 유저등록
	@Override
	public int registerGroupUser(Map<String, Object> map) throws Exception{
		AdminDao adminDao = sqlSession.getMapper(AdminDao.class);
		
		String encPassword = passwordEncoder.encode((CharSequence) map.get("userPw")); //비밀번호 암호화					
		
		map.remove("userPw");
		map.put("userPw", encPassword);
		
		int check = 0;
		check = adminDao.registerGroupUser(map);//그룹계정 유저등록 DAO		
		
		return check;
	}
	
	//그룹계정  Rtk등록
	@Override
	public int registerGroupRtk(Map<String, Object> map) {
		
		AdminDao adminDao = sqlSession.getMapper(AdminDao.class);
		int check = 0;
		check = adminDao.registerGroupRtk(map);//그룹계정 유저등록 DAO		
		return check;
	}

	//그룹코드 중복확인
	@Override
	public int groupCodeCheck(String string) {
		AdminDao adminDao = sqlSession.getMapper(AdminDao.class);		
		return adminDao.groupCodeCheck(string);
	}

	
	//그룹목록 가져오기
	@Override
	public List<AdminListDto> getGroupList(Map<String, Object> map) {
		AdminDao adminDao = sqlSession.getMapper(AdminDao.class);		
	
		int page = myValidator.notNumberToOne((String)map.get("page"));
		
		int end = page * Constance.GROUP_LIST_SIZE; //끝페이지
		int start = end - Constance.GROUP_LIST_SIZE; //시작페이지
		
		map.put("end", end);
		map.put("start", start);
		
		return adminDao.getGroupList(map);
	}

	//유저목록 가져오기
		@Override
		public List<AdminListDto> getUserList(Map<String, Object> map) {
			
			AdminDao adminDao = sqlSession.getMapper(AdminDao.class);		
		
			int page = myValidator.notNumberToOne((String)map.get("page"));
			
			int end = page * Constance.USER_LIST_SIZE; //끝페이지
			int start = end - Constance.USER_LIST_SIZE; //시작페이지
			
			map.put("end", end);
			map.put("start", start);
			
			return adminDao.getUserList(map);
		}

		
		//그룹이름 코드리스트
		@Override
		public List<Map<String, Object>> getGroupNameList() {
			AdminDao adminDao = sqlSession.getMapper(AdminDao.class);			
			return adminDao.getGroupNameList();
		}
			
		
		//일반계정유저추가
		@Override
		public int registerUser(Map<String, Object> map) {
			AdminDao adminDao = sqlSession.getMapper(AdminDao.class);
			
			String encPassword = passwordEncoder.encode((CharSequence) map.get("userPw")); //비밀번호 암호화					
			
			map.remove("userPw");
			map.put("userPw", encPassword);
			
			int check = 0;
			check = adminDao.registerUser(map);//그룹계정 유저등록 DAO
			
			return check;
		}

		
		//그룹수정삭제 페이지 이동 정보
		@Override
		public List<Map<String,Object>> getGroupInfo(Map<String,Object> map) {
			AdminDao adminDao = sqlSession.getMapper(AdminDao.class);
			
			return adminDao.getGroupInfo(map);
		}

		
		//그룹계정user update
		@Override
		public int updateGroupUser(Map<String, Object> map) {
			AdminDao adminDao = sqlSession.getMapper(AdminDao.class);		
			
			String encPassword = passwordEncoder.encode((CharSequence) map.get("userPw")); //비밀번호 암호화
			map.remove("userPw");
			map.put("userPw", encPassword);
			
			return adminDao.updateGroupUser(map);
		}

		//그룹계정 RTK update
		@Override
		public int updateGroupRtk(Map<String, Object> map) {
			
			AdminDao adminDao = sqlSession.getMapper(AdminDao.class);			
			return adminDao.updateGroupRtk(map);
		}

		
		//그룹Table update
		@Override
		public int updateGroupTable(Map<String, Object> map) {
			AdminDao adminDao = sqlSession.getMapper(AdminDao.class);
			
			return adminDao.updateGroupTable(map);
		}

		//해당그룹 기존RTK있는지 확인
		@Override
		public int getCheckGroupRtk(Map<String, Object> map) {
			AdminDao adminDao = sqlSession.getMapper(AdminDao.class);
			return adminDao.getCheckGroupRtk(map);
		}
		
		
		//유저수정삭제 페이지 이동 정보
		@Override
		public Map<String, Object> getUserInfo(Map<String, Object> map) {
			AdminDao adminDao = sqlSession.getMapper(AdminDao.class);			
			return adminDao.getUserInfo(map);
		}
		
		//일반유저 update
		@Override
		public int updateUser(Map<String, Object> map) {
			
			String encPassword = passwordEncoder.encode((CharSequence) map.get("userPw")); //비밀번호 암호화
			map.remove("userPw");
			map.put("userPw", encPassword);
			
			AdminDao adminDao = sqlSession.getMapper(AdminDao.class);			
			return adminDao.updateUser(map);

		}

		
		
	
	

}
