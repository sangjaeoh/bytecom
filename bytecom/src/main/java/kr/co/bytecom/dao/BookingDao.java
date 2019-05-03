package kr.co.bytecom.dao;

import java.util.List;
import java.util.Map;

public interface BookingDao {

	//유저 예약하기 페이지
	public List<String> getAllPlanId(Map<String,Object> map); //전체 PlanId 가져오기
	public List<Map<String,Object>> getBookingPlanIdList(Map<String,Object> map);// 입력 날짜별 (디폴트 오늘)예약현황 구하기
}
