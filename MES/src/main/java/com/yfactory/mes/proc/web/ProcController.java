package com.yfactory.mes.proc.web;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yfactory.mes.proc.service.ProcService;

@Controller
public class ProcController {

	@Autowired
	private ProcService procService;

	@GetMapping("/procPlMgt")
	public String procPlMgt() {

		return "proc/procPlMgt";
	}
	

	// 생산계획조회
	@GetMapping("/procPlSelect")
	public String procPlSelect() {

		return "proc/procPlSelect";
	}

	// 생산지시관리
	@GetMapping("/procOrderMng")
	public String procOrderMng() {

		return "proc/procOrderMng";
	}
	// 생산지시조회
	@GetMapping("/procOrderSelect")
	public String procOrderSelect() {

		return "proc/procOrderSelect";
	}
	@GetMapping("/procManagement")
	public String procManagement() {
		
		return "proc/procManagement";
	}
	@GetMapping("/procProcessCtl")
	public String procProcessCtl() {
		
		return "proc/procProcessCtl";
	}
	
	// 제품공정흐름도
	@RequestMapping("/procLineForm")
	public String procLineForm() {
		return "proc/procLineForm";
	}


	// 주문서목록 모달
	@GetMapping("/ordermodal")
	public String ordermodal() {
		return "/proc/procmodal/ordermodal";
	}

	// 제품목록 모달
	@GetMapping("/prdmodal")
	public String prdmodal() {
		return "/proc/procmodal/prdmodal";
	}

	// 생산계획조회 모달
	@GetMapping("/procplselectmodal")
	public String procplselectmodal() {
		return "/proc/procmodal/procplselectmodal";
	}

	// 생산지시관리 모달
	@GetMapping("/procodermngModal")
	public String procodermngModal() {
		return "/proc/procmodal/procodermngModal";
	}
	// 생산지시목록 모달
	@GetMapping("/procOrderListModal")
	public String procOrderListModal() {
		return "/proc/procmodal/procOrderListModal";
	}
	
	// 공정실적조회
	@GetMapping("/procResult")
	public String procResult() {
		return "proc/procResult";
	}
	
	// 공정실적조회 - 생산지시코드 모달
	@GetMapping("/procResultCdModal")
	public String procResultCdModal() {
		return "proc/procmodal/procResultCdModal";
	}
	
	// 공정실적조회 - 공정명 모달
	@GetMapping("/procResultNmModal")
	public String procResultNmModal() {
		return "proc/procmodal/procResultNmModal";
	}
	

	// 미사용 설비 목록 모달
	@GetMapping("/procNoUseEqSelectModal")
	public String procNoUseEqSelectModal() {
		return "proc/procmodal/procNoUseEqSelectModal";
		}
	
	// 공정 목록 모달
	@GetMapping("/procCdModal")
	public String procCdModal() {
		return "proc/procmodal/procCdModal";
	}


}
