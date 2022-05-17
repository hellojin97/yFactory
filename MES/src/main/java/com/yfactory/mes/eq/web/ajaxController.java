package com.yfactory.mes.eq.web;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
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
	
	
	// 돋보기 클릭시 리스트를 가져오는 메서드
	@PostMapping("/getEqListAjax")
	@ResponseBody
	public List<Map<String, String>> getEqListAjax(@PathVariable String  eq_cd) {
		return mapper.searchEq(eq_cd); 
	}
	
	
}
