package com.yfactory.mes.mtrl.web;

import java.io.InputStream;
import java.sql.Connection;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yfactory.mes.mtrl.service.MtrlService;

import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.util.JRLoader;

@Controller
public class MaterialController {
	@Autowired MtrlService service;
	@Autowired DataSource  datasource;
	
	//발주등록폼
	@RequestMapping("/mtrlOrderForm")
	public String mtrlOrderForm() {
		
		return "material/mtrlOrderForm";
	}
	//발주조회폼
	@RequestMapping("/mtrlListForm")
	public String mtrlLIstForm() {
		return "material/mtrlListForm";
	}
	
	//입고관리,등록폼
	@RequestMapping("/mtrlInsertForm")
	public String mtrlInsertForm() {
		return "material/mtrlInsertForm";
	}
	//입고조회폼
	@RequestMapping("/mtrlInsertListForm")
	public String mtrlInsertListForm() {
		return "material/mtrlInsertListForm";
	}
	
	//LOT재고조회폼
	@RequestMapping("/mtrlLotForm")
	public String mtrlLotForm() {
		return "material/mtrlLotForm";
	}
	
	//안전재고조회
	@RequestMapping("/mtrlSafetyForm")
	public String mtrlSafetyForm() {
		return "material/mtrlSafetyForm";
	}
	//원자재재고조회
	@RequestMapping("/mtrlStorageForm")
	public String mtrlStorageForm() {
		return "material/mtrlStorageForm";
	}
	
	
	/*
	 * MODAL 이동 
	 */
	//자제명 검색
	@RequestMapping("/mtcdModal")
	public String mtcdModal() {
		return "material/mtrlModal/mtcdModal";
	}
	//업체명 검색
	@RequestMapping("/vdrModal")
	public String vdrModal() {
		return "material/mtrlModal/vdrModal";
	}
	
	//발주코드 검색
	@RequestMapping("/pocdModal")
	public String poCdModal() {
		return "material/mtrlModal/pocdModal";
	}
	//입고예정 조회
	@RequestMapping("/mtrlExpectModal")
	public String mtrlExpectModal() {
		return "material/mtrlModal/mtrlExpectModal";
	}
	
	/*
	 * jasper
	 */
	@RequestMapping("mtrlOrderJasper")
	public void report(HttpServletRequest request, HttpServletResponse response) throws Exception {
	Connection conn = datasource.getConnection();
	InputStream jasperStream = getClass().getResourceAsStream("/jasper/mtrlOrder.jasper");
	JasperReport jasperReport = (JasperReport) JRLoader.loadObject(jasperStream); //파라미터 맵
	JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, null, conn);
	JasperExportManager.exportReportToPdfStream(jasperPrint, response.getOutputStream());
	}

	
}
 