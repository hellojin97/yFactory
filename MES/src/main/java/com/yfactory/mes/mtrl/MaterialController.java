package com.yfactory.mes.mtrl;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MaterialController {

	@RequestMapping("/orderForm")
	public String orderForm() {
		return "material/orderForm";
	}
}
 