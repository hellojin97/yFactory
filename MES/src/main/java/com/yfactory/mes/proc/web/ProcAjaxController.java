package com.yfactory.mes.proc.web;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.yfactory.mes.proc.service.ProcService;

@RestController
public class ProcAjaxController {

	@Autowired private ProcService procService;
	
	
	@GetMapping("/procPlListAjax")
	public List<Map> selectOrdersList(String ordCd) {
		return procService.OrderSelectOk(ordCd);
		
	}

	

	
}
