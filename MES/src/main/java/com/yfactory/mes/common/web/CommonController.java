package com.yfactory.mes.common.web;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
	      System.out.println(loginUser);
	      
	      String result = "common/home";
	      
	      if (loginUser != null) {
	         session.setAttribute("loginUser", loginUser);
	         return result;
	         //redirect:common/home
	      } else {
	    	 mo.addAttribute("message", "로그인을 실해하였습니다. 다시 시도하세요.");
	    	 return result;
	      }
	     
	   }
}
