package com.yfactory.mes.test;

import com.yfactory.mes.common.vo.CommVO;
import com.yfactory.mes.common.vo.DeptVO;
import com.yfactory.mes.common.vo.EmployeeVO;
import com.yfactory.mes.common.vo.ImageAttachVO;
import com.yfactory.mes.common.vo.VendorVO;
import com.yfactory.mes.sales.vo.OrdersVO;

import lombok.Data;

@Data
public class TestVO {
	private CommVO comm_code;
	private DeptVO dept;
	private EmployeeVO employee;
	private ImageAttachVO img_attach;
	private VendorVO vendor;
	private OrdersVO orders;
	
}
