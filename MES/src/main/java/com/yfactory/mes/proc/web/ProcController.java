package com.yfactory.mes.proc.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

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

}
