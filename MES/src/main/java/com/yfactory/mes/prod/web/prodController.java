package com.yfactory.mes.prod.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.yfactory.mes.prod.service.ProdService;


@Controller
public class prodController {

	@Autowired private ProdService prodService;
	
	

}
