package com.yfactory.mes.eq.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.yfactory.mes.eq.mapper.EquipMapper;

@RestController
public class ajaxController {
	// ajax 부분 처리 컨트롤러

	// 매퍼 연결
	@Autowired
	public EquipMapper mapper;

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

	@GetMapping("/eqPrcSelctAjax") // 단건 조회
	@ResponseBody
	public List<Map> eqPrcSelctAjax(String eqCd) {
		return mapper.selectEqPrc(eqCd);
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
	
	@GetMapping("/getEqInListAjax")
	@ResponseBody
	public List<Map> getEqInListAjax(){
		return mapper.getEqInList();
	}

	//점검 전체 리스트
	@GetMapping("/eqActListAjax")
	@ResponseBody
	public List<Map> eqActListAjax(){
		return mapper.getEqChkList();
	}
	// 설비구분명 + 점검시작일 + 점검종료일 기준 조회 
	@RequestMapping(value = "/eqChkListAajx", method = RequestMethod.POST)
	public List<Map> eqChkListAajx(@RequestBody HashMap<String, Object> list){
		
		return mapper.getEqChkSelectList(list);
	}
	


}