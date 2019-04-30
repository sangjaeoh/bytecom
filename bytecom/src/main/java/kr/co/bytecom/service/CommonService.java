package kr.co.bytecom.service;

import java.util.Map;

import org.springframework.stereotype.Component;

import kr.co.bytecom.util.Pagination;

public interface CommonService {

	Pagination getpagination(Map<String,Object> map);
}
