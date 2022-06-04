package com.yfactory.mes.common.web;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yfactory.mes.common.service.CommonService;
import com.yfactory.mes.common.vo.EmployeeVO;

@Controller
public class CommonController {

	@Autowired private CommonService service;
	
	@RequestMapping("/userOrderForm")
	public String userOrderForm() {
		return "user/userOrderForm";
	}
	
	// 로그인 처리
	@RequestMapping("/userLogin")
	public String userLogin(HttpSession session, EmployeeVO empVO, HttpServletResponse response, Model mo) throws Exception {
	      EmployeeVO loginUser = service.userLogin(empVO);
	      
	      String result;
	      
	      
	      
	      
	      
	      if (loginUser != null) {
	         session.setAttribute("loginUser", loginUser);
	         int empNo = loginUser.getDept_no();
	         session.setAttribute("userDept", service.userDept(empNo));
	         int Emp = loginUser.getEmp_no();
	         String profile =  service.userProfile(Emp);
	         
	         if(profile != null) {
	        	 
	        	 session.setAttribute("profile", profile);
	        	 
	         } else {
	        	 session.setAttribute("profile", "data:image/png;base64,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");
	         }
	         
	         
	         result = "common/home";
	         return result;
	         //redirect:common/home
	      } else {
	    	 mo.addAttribute("message", "로그인을 실해하였습니다. 다시 시도하세요.");
	    	 result = "loginForm";
	    	 return result;
	      }
	     
	   }
	
	//로그아웃 처리
	@RequestMapping("/userLogOut")
	public String userLogOut(HttpSession session, Model mo) {
		session.invalidate();
		mo.addAttribute("message", "로그아웃이 완료되었습니다.");
		return "common/home";
	}
}
