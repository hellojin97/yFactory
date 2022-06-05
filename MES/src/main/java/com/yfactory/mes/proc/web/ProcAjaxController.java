package com.yfactory.mes.proc.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.yfactory.mes.proc.service.ProcService;

@RestController
public class ProcAjaxController {

	@Autowired
	private ProcService procService;

	// 주문서 단건조회 procOrderSelect
	//@GetMapping("/procOrderSelect")
	@GetMapping("/orderSelectOk")
	public List<Map> OrderSelectOk(String ordCd) {
		return procService.OrderSelectOk(ordCd);

	}

	// 주문서 전체조회
	//@GetMapping("/procOrderListAjax")
	@GetMapping("/procOrderSelectAll")
	public List<Map> ProcOrderSelectAll() {

		return procService.ProcOrderSelectAll();

	}
	// 생산계획전체조회 procPlListAjax

	//@GetMapping("/procPlanListAjax")
	@GetMapping("/procPlanAll")
	public List<Map> ProcPlanAll() {
		//System.out.println(procService.procPlanAll());
		return procService.ProcPlanAll();

	}
	// 생산계획날짜별조회 procPlDtAjax
	//@GetMapping("/procPlDtAjax")
	@GetMapping("/prdtPlanSelect")
	public List<Map> PrdtPlanSelect(String date1, String date2){
		
		return procService.PrdtPlanSelect(date1, date2);
	}
	// 생산계획날짜별단건
	//@GetMapping("/procPlListOneAjax")
	@GetMapping("/procPlanSelect")
	public List<Map> ProcPlanSelect(String ppCd){
		
		return procService.ProcPlanSelect(ppCd);
	}
	
	// 생산계획조회상태 ProcPlanSelectState
	@RequestMapping(value = "/procPlanSelectState", method = RequestMethod.POST)
	public List<Map> ProcPlanSelectState(@RequestBody HashMap<String, Object> procPlSelect){
		return procService.ProcPlanSelectState(procPlSelect);
	}

	// 제품 조회
	//@GetMapping("/prdSelect")
	@GetMapping("/prdSelect")
	public List<Map> PrdSelect() {
		return procService.PrdSelect();
	}

	//@GetMapping("/prdSelectOne")
	@GetMapping("/prdSelectOne")
	public List<Map> PrdSelectOne(String prodCd) {
		return procService.PrdSelectOne(prodCd);
	}

	// 생산계획등록
	@PostMapping("/procPlanInsert")
	public int ProcPlanInsert(@RequestParam Map<String, String> procPI) {
				
			System.out.println(procPI);
		
		return procService.ProcPlanInsert(procPI);
	}
	
	// 생산지시등록
	@PostMapping("/prdInsInsert")
	public int prdInsInsert(@RequestParam Map<String, Object> prdIns) {
		System.out.println(prdIns);
		return procService.prdInsInsert(prdIns);
	}
	
	//procDtPlanSelect
	//@GetMapping("/prdSelectOne")
	// 생산미지시계획
	@GetMapping("/NoPlanSelect")
	public List<Map> NoPlanSelect(String state) {
		return procService.NoPlanSelect(state);
	}
	// 상세생산계획
	@GetMapping("/procDtPlanSelect")
	public List<Map> procDtPlanSelect(@RequestParam Map<String,String> ppCd) {
		
			System.out.println(ppCd);
		return procService.procDtPlanSelect(ppCd);
	}
	
	// 라인코드
	@GetMapping("/procLineSelect")
	public List<Map> procLineSelect(@RequestParam Map<String,String> prodNm){
		System.out.println(prodNm);
		return procService.ProcLineSelect(prodNm);
	}
	// 필요자재
	@RequestMapping(value = "/procNeedMtrl", method = RequestMethod.POST)
	public List<Map> ProcNeedMtrl(@RequestBody HashMap<String, Object> line) {
		return procService.ProcNeedMtrl(line);
	}
	// 자재 LOT 목록
	@RequestMapping(value = "/procNeedMtrlLOT", method = RequestMethod.POST)
	public List<Map> ProcNeedMtrlLOT(@RequestBody HashMap<String, Object> mtNm) {
		return procService.ProcNeedMtrlLOT(mtNm);
	}
	
	// 생산 지시 조회
	@RequestMapping(value = "/procOrderSelect", method = RequestMethod.POST)
	public List<Map> ProcOrderSelect(@RequestBody HashMap<String, Object> list) {
		return procService.ProcOrderSelect(list);
	}
	// 생산 지시 목록
	@RequestMapping(value = "/procOrderList", method = RequestMethod.POST)
	public List<Map> ProcOrderList(@RequestBody HashMap<String, Object> list) {
		return procService.ProcOrderList(list);
	}
	// 생산 지시 코드 단건조회
	@GetMapping("/procOrderCdSelectOne")
	public List<Map> ProcOrderCdSelectOne(String dtlCd) {
		return procService.ProcOrderCdSelectOne(dtlCd);
	}
	// 생산 지시 코드 단건조회
	@GetMapping("/procOrderLineSelectOne")
	public List<Map> ProcOrderLineSelectOne(String line) {
		System.out.println(procService.ProcOrderLineSelectOne(line));
		return procService.ProcOrderLineSelectOne(line);
	}
	
	// 생산 로직
	@RequestMapping(value = "/procStartLogic", method = RequestMethod.POST)
	public int ProcStartLogic(@RequestBody HashMap<String, Object> list) {
		return procService.ProcStartLogic(list);
	}
	
	// 공정 실적 조회
	@GetMapping("/procResultList")
	public List<Map> procResultList(){
		return procService.procResultList();
	}
	
	// 공정 실적 조회 - 생산 지시 모달 조회
	@GetMapping("/procResultOrdersList")
	public List<Map> procResultOrdersList(){
		return procService.procResultOrdersList();
	}
	
	// 공정 실적 조회 - 공정 모달 조회
	@GetMapping("/procResultProcessList")
	public List<Map> procResultProcessList(){		
		return procService.procResultProcessList();
	}
	// 공정 관리 조회
	@GetMapping("/procProcessCtlSelect")
	public List<Map> procProcessCtlSelect(){
		System.out.println(procService.procProcessCtlSelect());
		return procService.procProcessCtlSelect();
	}
	// 공정 체크박스 목록
	@GetMapping("/procProcessCheckList")
	public List<Map> procProcessCheckList(){
		
		return procService.procProcessCheckList();
	}
	// 공정 관리 선택 조회
	@GetMapping("/procCdNmSelect")
	public List<Map> procCdNmSelect(String cdNm){
		
		return procService.ProcCdNmSelect(cdNm);
	}
	// 미사용 설비 목록 조회
	@GetMapping("/procNoUseEqSelect")
	public List<Map> ProcNoUseEqSelect(String eqCd){
		
		return procService.ProcNoUseEqSelect(eqCd);
	}
	
	// 공정 실적 조회 - 단건 조회
	@PostMapping("/searchProcResult")
	public List<Map> searchProcResult(@RequestParam Map<String, String> result){
		return procService.searchProcResult(result);
	}
	
	
	@PostMapping("/procCancelPl")
	public int procCancelPl(@RequestParam Map<String, String> Cancel) {
	
			System.out.println(Cancel);
		return procService.procCancelPl(Cancel);
	}
	
	@PostMapping("/procStopLogic")
	public int ProcStopLogic(@RequestBody List<HashMap<String, Object>> list) {
		System.out.println(list);
		int result = procService.ProcStopLogic(list);
		
		if(result > 0) {
			return 1;
		}else {
			return 0;
		}
	}
	@PostMapping("/procRestartLogic")
	public int ProcRestartLogic(@RequestBody List<HashMap<String, Object>> list) {
		
		int result = procService.ProcRestartLogic(list);
		
		if(result > 0) {
			return 1;
		}else {
			return 0;
		}
	}
	
	@GetMapping("/procLineAjax")
	public List<Map> procLineAjax(){
		return procService.procLineAjax();
	}
	
}
