package com.yfactory.mes.quality.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yfactory.mes.quality.mapper.QualityMapper;

@Controller
public class QualityController {

	@Autowired QualityMapper mapper;

	// 페이지
	// 품질검사요청
	@RequestMapping("/qa_request")
	public String qa_request() {
		return "quality/qa_request";
	}
	
	// 품질검사관리
	@RequestMapping("/qa_requestMgr")
	public String qa_requestMgr() {
		return "quality/qa_requestMgr";
	}
	
	// 품질검사결과
	@RequestMapping("/qa_result")
	public String qa_result() {
		return "quality/qa_result";
	}
	
	// 불량내역관리
	@RequestMapping("/qa_errlot")
	public String qa_errlot() {
		return "quality/qa_errlot";
	}
	
	// modal
	// 발주상세코드 Modal 호출
	@RequestMapping("/poDtlCdModal")
	public String poDtlCdModal() {
		return "quality/qamodal/poDtlCdModal";
	}
	
	// 불량코드 Modal 호출
	@RequestMapping("/errModal")
	public String errModal() {
		return "quality/qamodal/errModal";
	}
}
