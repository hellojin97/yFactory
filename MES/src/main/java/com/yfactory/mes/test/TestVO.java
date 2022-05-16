package com.yfactory.mes.test;

import com.yfactory.mes.bom.vo.BomVO;
import com.yfactory.mes.common.vo.CommVO;
import com.yfactory.mes.common.vo.DeptVO;
import com.yfactory.mes.common.vo.EmployeeVO;
import com.yfactory.mes.common.vo.ImageAttachVO;
import com.yfactory.mes.common.vo.VendorVO;
import com.yfactory.mes.eq.vo.EqChkVO;
import com.yfactory.mes.eq.vo.EqInaVO;
import com.yfactory.mes.eq.vo.EqRstatVO;
import com.yfactory.mes.eq.vo.EqUphcalVO;
import com.yfactory.mes.eq.vo.EqVO;
import com.yfactory.mes.mtrl.vo.MtCurqtyVO;
import com.yfactory.mes.mtrl.vo.MtLotVO;
import com.yfactory.mes.mtrl.vo.MtPoDtlVO;
import com.yfactory.mes.mtrl.vo.MtPoVO;
import com.yfactory.mes.mtrl.vo.MtVO;
import com.yfactory.mes.mtrl.vo.MtWrnotVO;
import com.yfactory.mes.proc.vo.LineVO;
import com.yfactory.mes.proc.vo.PlanDtlVO;
import com.yfactory.mes.proc.vo.PrdInsVO;
import com.yfactory.mes.proc.vo.PrdInsdtlVO;
import com.yfactory.mes.proc.vo.PrdtPlVO;
import com.yfactory.mes.proc.vo.ProcErrVO;
import com.yfactory.mes.proc.vo.ProcPrcVO;
import com.yfactory.mes.proc.vo.ProcStVO;
import com.yfactory.mes.proc.vo.ProcessVO;
import com.yfactory.mes.prod.vo.ProdCurQtyVO;
import com.yfactory.mes.prod.vo.ProdLotVO;
import com.yfactory.mes.prod.vo.ProdVO;
import com.yfactory.mes.prod.vo.ProdWrnVO;
import com.yfactory.mes.quality.vo.ErrCodeVO;
import com.yfactory.mes.quality.vo.MtCheckVO;
import com.yfactory.mes.quality.vo.MtErrListVO;
import com.yfactory.mes.quality.vo.ProdErrListVO;
import com.yfactory.mes.sales.vo.OrdDetailVO;
import com.yfactory.mes.sales.vo.OrdResVO;
import com.yfactory.mes.sales.vo.OrdersVO;

import lombok.Data;

@Data
public class TestVO {
	//BOM
	private BomVO bom;	
	
	//COMMON
	private CommVO comm_code;
	private DeptVO dept;
	private EmployeeVO employee;
	private ImageAttachVO img_attach;
	private VendorVO vendor;
	
	//EQ
	private EqVO eq;
	private EqChkVO eq_chk;
	private EqInaVO eq_ina;
	private EqRstatVO eq_restat;
	private EqUphcalVO eq_uphcal;
	
	//MTRL
	private MtVO mt;
	private MtCurqtyVO mt_curqty;
	private MtLotVO mt_lot;
	private MtPoDtlVO mt_poDtl;
	private MtPoVO mt_po;
	private MtWrnotVO mt_wrnot;
	
	//PROC
	private LineVO line;
	private PlanDtlVO plan_dtl;
	private PrdInsVO prd_ins;
	private PrdInsdtlVO prd_insDtl;
	private PrdtPlVO prdt_pl;
	private ProcErrVO proc_err;
	private ProcessVO process;
	private ProcPrcVO proc_prc;
	private ProcStVO proc_st;
	
	//PROD
	private ProdVO prod;
	private ProdCurQtyVO prod_curQty;
	private ProdLotVO prod_lot;
	private ProdWrnVO prod_wrn;
	
	//QUALITY
	private ErrCodeVO err_code;
	private MtCheckVO mt_check;
	private MtErrListVO mt_errList;
	private ProdErrListVO prod_errList;	
	
	//SALES
	private OrdersVO orders;
	private OrdResVO ord_res;
	private OrdDetailVO ord_dtl;
	
	
}
