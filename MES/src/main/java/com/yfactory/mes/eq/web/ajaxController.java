package com.yfactory.mes.eq.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Update;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.yfactory.mes.eq.mapper.EquipMapper;
import com.yfactory.mes.eq.service.EquipService;

@RestController
public class ajaxController {
	// ajax 부분 처리 컨트롤러

	// 매퍼 연결
	@Autowired
	public EquipService mapper;

	// 이미지 등록 구현 시도
	/*
	 * @RequestMapping("/eqinsert.do")
	 * 
	 * @ResponseBody public Boolean uploadImage(MultipartFile image, String dirName)
	 * throws Exception { Boolean result = Boolean.FALSE; try{ File folder = new
	 * File(dirName); if (!folder.exists()) folder.mkdirs();
	 * 
	 * File destination = new File(dirPath + File.separator +
	 * image.getOriginalFilename()); image.transferTo(destination);
	 * 
	 * result = Boolean.TRUE; }catch (Exception e){ log.error("에러 : " +
	 * e.getMessage()); }finally { return result; } }
	 */
	
	
	
	
	

	// 조회 클릭시 리스트를 가져오는 메서드
	@GetMapping("/getEqDivList") // 전체리스트
	@ResponseBody
	public List<Map> getEqDivList() {
		return mapper.searchEq();
	}

	@GetMapping("/eqSelectAjax") // 단건 조회
	@ResponseBody
	public List<Map> eqSelect(String eqCd) {
		return mapper.selectEq(eqCd);
	}

	@GetMapping("/getEqMngList") // 설비관리페이지 설비리스트
	@ResponseBody
	public List<Map> getEqMngList() {
		return mapper.searchEqMngList();
	}

	@GetMapping("/getPrcList")// 공정코드 공정명 리스트
	@ResponseBody
	public List<Map> getPrcList() {
		return mapper.searchPrcList();
	}

	@GetMapping("/eqPrcSelectAjax") // 단건 조회
	@ResponseBody
	public List<Map> eqPrcSelctAjax(String prcCd) {
		return mapper.selectEqPrc(prcCd);
	}
	
	@GetMapping("/getEmpListAjax") // 사원코드 사원명 조회
	@ResponseBody
	public List<Map> getEmpListAjax() {
		return mapper.searchEmp();
	}
	
	@GetMapping("/getVdrListAjax") // 업체코드 업체구분코드 업체명
	@ResponseBody
	public List<Map> getVdrListAjax() {
		return mapper.getVdrList();
	}
	
	@GetMapping("/getEqActStatListAjax") // 설비비가동 상태및 설비 사용여부 조회
	@ResponseBody
	public List<Map> getEqActStatListAjax() {
		return mapper.getEqActStatList();
	}
	
	@GetMapping("/getEqInActListAjax") // 설비 사용여부 및 비가동 상태를 포함판 검색
	@ResponseBody
	public List<Map> getEqInActListAjax(String key){
		return mapper.getEqInActList(key);
	}
	
	@PostMapping("/setEqInAjax") // 비가동 설비 내역 추가
	public String setEqInAjax(@RequestParam Map<String, String> result){
		mapper.setEqIn(result);
		return "성공";
	}
	
	@GetMapping("/getEqInListAjax") //비가동 설비 내역 조회
	@ResponseBody
	public List<Map> getEqInListAjax(){		
		return mapper.getEqInList();
	}
	
	@GetMapping("/searchEqInaAjax")
	@ResponseBody
	public List<Map> searchEqInaAjax(@RequestParam Map<String, String> result){
		return mapper.searchEqIna(result);
	}
	
	@PostMapping("/updateIna") // 비가동 설비 재가동
	public int updateIna(@RequestParam Map<String, String> result) {
		System.out.println("11111111111111"+result);
		System.out.println(mapper.updateIna(result));
		return mapper.updateIna(result);
	}


	//점검 전체 리스트
	@GetMapping("/eqActListAjax")
	@ResponseBody
	public List<Map> eqActListAjax(){
		return mapper.getEqChkList();
	}
	// 설비구분명 + 점검시작일 + 점검종료일 기준 조회  // 참고 : https://dororongju.tistory.com/124
	@RequestMapping(value = "/eqChkSelectAjax", method = RequestMethod.POST)
	public List<Map> eqChkListAajx(@RequestBody HashMap<String, Object> list){
		
		return mapper.getEqChkSelectList(list);

	}
	
	//점검 일일 건수
	@RequestMapping("/getEqDailyChkListAjax")
	@ResponseBody
	public List<Map> getEqDailyChkListAjax(@RequestParam("chkdt1") String chkdt1 , @RequestParam("chkdt2") String chkdt2){
		return mapper.getEqDailyChkCount(chkdt1 , chkdt2);
	}
	
	@RequestMapping(value="/eqChkResultAjax" , method=RequestMethod.POST)
	public int eqChkResultAjax(@RequestBody List<HashMap<String, Object>> list){
		
		System.out.println("--------------------->"+list);
		int result = mapper.eqChkResultAjax(list);
		if(result > 0) {
			return 1;
		}else {
			return 0;
		}
		
	}
	// 일점검건수 등록버튼 기능부
	@RequestMapping(value="/dailyChkListAjax" ,method=RequestMethod.POST)
	public List<Map>dailyChkListAjax(@RequestBody List<HashMap<String, Object>> list){
		System.out.println("--dailyChkListAjax-->"+list);
		return mapper.dailyChkListAjax(list);
	}
	// 점검관리 페이지 삭제 버튼 기능부
	@RequestMapping(value="/eqChkDelAjax" , method=RequestMethod.DELETE)
	public int eqChkDelAjax(@RequestBody List<HashMap<String, Object>> list){
		
		System.out.println("--------------------->"+list);
		int result = mapper.eqChkDelAjax(list);
		if(result > 0) {
			return 1;
		}else{
			return 0;
		}
		
	}
	// 설비 관리 
	@RequestMapping("/eqMngUpdateAjax")
	public int eqMngUpdateAjax(@RequestBody List<HashMap<String, Object>> list) {
		int result  = mapper.eqMngUpdateAjax(list);
		if(result > 0) {
			return 1;
		}else {
			return 0;
		}
		 
	}
	
	
	
	
	
}