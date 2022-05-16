package com.yfactory.mes.sales.vo;

import java.sql.Date;

/*
 *  등록일자 : 2022-05-14
 *  등록자    : 김현진
 *  연결 테이블 명 : Orders
 *  테이블 물리명 : 주문
 */

public class OrdersVO {
	
	
	
//	Ord_cd		주문코드 PK
	private String ord_cd;
//	Vdr_cd		업체코드 FK Vendor.vdr_cd
	private String vdr_cd;
//	Req_dt		주문일자
	private Date req_dt;
//	Res_dt		납기일자
	private Date res_dt;
//	Prog_cd		진행상황코드 FK Comm_cd.comm_cd
	private String prog_cd;
	
}
