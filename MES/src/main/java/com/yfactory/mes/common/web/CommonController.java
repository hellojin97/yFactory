package com.yfactory.mes.common.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.yfactory.mes.common.service.CommonService;

@Controller
public class CommonController {

	@Autowired private CommonService service;
}
