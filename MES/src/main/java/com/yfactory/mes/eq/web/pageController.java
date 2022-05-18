package com.yfactory.mes.eq.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yfactory.mes.eq.mapper.EquipMapper;

@Controller
public class pageController {
	// 페이지 부분 정의 컨트롤러
	
	@Autowired
	public EquipMapper mapper;
	
	
	@RequestMapping("/eqInsert")
	public String eqInsert(){
		// 설비 페이지  - 설비등록
		return "eq/eqInsert";
		
	}
	
	@RequestMapping("/eqMng")
	public String eqMng(){
		// 설비 페이지 - 설비관리
		return "eq/eqMng";
		
	}
	
	@RequestMapping("/eqChkMng")
	public String eqChkMng(){
		// 설비 페이지 - 점검관리
		return "eq/eqChkMng";
		
	}
	
	@RequestMapping("/eqIna")
	public String eqIna(){
		// 설비 페이지 - 비가동 관리
		return "eq/eqIna";
		
	}
	
	@RequestMapping("/eqRstat")
	public String eqRstat(){
		// 설비 페이지 - 실시간 설비 상태
		return "eq/eqRstat";
		
	}
	// 설비 구분 모달창 출력
	@GetMapping("/eqdvmodal")
	public String eqmodal() {
		return "/eq/eqmodal/eqdvmodal";
	}
	
}
