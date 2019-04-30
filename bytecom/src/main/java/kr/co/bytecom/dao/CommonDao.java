package kr.co.bytecom.dao;

import java.util.Map;

public interface CommonDao {

	public int getTotalGroupCount(Map<String,Object> map); //메인 그룹목록 전체 게시물수
	public int getTotalUserCount(Map<String,Object> map); //메인 유저목록 전체 게시물수
	
}
