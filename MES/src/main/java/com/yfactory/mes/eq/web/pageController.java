package com.yfactory.mes.eq.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.yfactory.mes.eq.mapper.EquipMapper;
import com.yfactory.mes.eq.vo.EqVO;

@Controller
public class pageController {
	// 페이지 부분 정의 컨트롤러
	
	@Autowired
	public EquipMapper mapper;
	
//	@Autowired
//	private String saveDir;
	 
	@RequestMapping("/eqInsert")
	public String eqInsert(){
		// 설비 페이지  - 설비등록
		return "eq/eqInsert";
		
	}
	
	@RequestMapping("/eqMng")
	@ResponseBody
	public String eqMng(EqVO vo , MultipartFile file , Model model){
		System.out.println( vo.getImg_path() );
		
		mapper.insertEq(vo); 
		
//		if(file.isEmpty()) { // 파일이 비어있다면 TRUE
////			mapper.insertEq(vo); // 비어있다면 DB에 저장을 시도
//		}else { // 비어있지 않다면
//			String originFileName = file.getOriginalFilename();
//			String saveFileName =UUID.randomUUID().toString()+originFileName.substring(originFileName.lastIndexOf('.'));
//			
//			
//			
//			try {
//				file.transferTo(new File(saveDir, saveFileName));// 물리적 위치에 저장
//				
//				saveFileName = saveDir + saveFileName; // 저장된 물리 경로를 포함
//				
//				// DB저장
//				vo.setUuid(saveFileName);
//				//vo.setFileName(originFileName);
//				//vo.setUuidFile(saveFileName);
//				mapper.insertEq(vo);
//
//					} catch (IllegalStateException | IOException e) {
//						e.printStackTrace();
//						} 
//					}
//		System.out.println("--------------------------");
//		System.out.println(vo.getUuid());
//		model.addAttribute("src" , vo.getUuid());
		return "eq/eqMngPage"; // 다 처리 하고 설비관리로 가라 
	}
	
	@RequestMapping("/eqMngPage")
	public String eqMngPage() {
		return "eq/eqMngPage";
	}
	
	
	@RequestMapping("/eqChkMng")
	public String eqChkMng(){
		// 설비 페이지 - 점검관리
		return "eq/eqChkMng";
		
	}
	
	@RequestMapping("/eqIna")
	public String eqIna(){
		// 설비 페이지 - 비가동 관리
		return "eq/eqIna";
		
	}
	
	@RequestMapping("/eqRstat")
	public String eqRstat(){
		// 설비 페이지 - 실시간 설비 상태
		return "eq/eqRstat";
		
	}
	// 설비 구분 모달창 출력
	@GetMapping("/eqdvmodal")
	public String eqmodal() {
		return "/eq/eqmodal/eqdvmodal";
	}
	// 설비관리 페이지 - 설비명 + 설비 코드
	@GetMapping("/mngmodal")
	public String mngmodal() {
		return "/eq/eqmodal/mngmodal";
	}
	
	// 설비관리 페이지 - 공정코드 + 공정명
		@GetMapping("/eqPrcmodal")
		public String eqPrcmodal() {
			return "/eq/eqmodal/eqPrcmodal";
		}
		
	
		// 설비등록 페이지 - 사원번호 + 사원명
		@GetMapping("/eqInstermodal")
			public String eqInstermodal() {
				return "/eq/eqmodal/eqInstermodal";
		}
		
		
		// 설비등록 페이지 - 업체코드 + 업체구분코드(설비 / 자재(입고 , 출고) ... ) + 업체명
		@GetMapping("/eqvdrmodal")
			public String eqvdrmodal() {
				return "/eq/eqmodal/eqvdrmodal";
		}
			
	
}
