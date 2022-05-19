package com.yfactory.mes.eq.web;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
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
	@GetMapping("/getEqDivList")
	@ResponseBody
	public List<Map>getEqDivList() {
		return mapper.searchEq(); 
  }
	@GetMapping("/eqSelectAjax")
	@ResponseBody
	public List<Map> eqSelect(String eqCd){
		return mapper.selectEq(eqCd);
	}
	
//	//설비 등록시 설비관리 페이지로 이동하면서 자동으로 등록되는 메서드
//	@RequestMapping("/insertAjax")
//	@ResponseBody
//	public List<Map> eqMng(Model model){
//		
//		//model.addAttribute("msg", "다시 확인");
//		// 설비 페이지 - 설비등록
//		return mapper.insertEq();
//		}
//	
	
}