package kr.co.bytecom.service;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kr.co.bytecom.dao.CommonDao;
import kr.co.bytecom.util.Constance;
import kr.co.bytecom.util.Pagination;

@Component
public class CommonServiceImpl implements CommonService {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public Pagination getpagination(Map<String, Object> map) {
		
		CommonDao commonDao = sqlSession.getMapper(CommonDao.class);
		
		
		int listSize = Constance.GROUP_LIST_SIZE;
		int navSize = Constance.NAVIGATION_SIZE;
		String authCode = (String)map.get("authCode");
		int page = Integer.parseInt((String)map.get("page"));
		
		
		Pagination pagination = new Pagination();	
		
		int totalCount = 0;
		if(authCode.equals("group")) {
		totalCount = commonDao.getTotalGroupCount(map);
		}
		if(authCode.equals("user")) {
			totalCount = commonDao.getTotalUserCount(map);
			}
		pagination.setTotalCount(totalCount);
					
		
		int totalPageCount = (totalCount -1) / listSize + 1;
		pagination.setTotalPageCount(totalPageCount);			
		pagination.setNowFirst(page <= navSize);		
		pagination.setNowEnd((totalPageCount - 1) / navSize * navSize < page);
		pagination.setPageNo(page);
		
		return pagination;
	}

}
