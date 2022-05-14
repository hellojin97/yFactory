package com.yfactory.mes.sales.vo;

import java.sql.Date;

/*
 *  등록일자 : 2022-05-14
 *  등록자    : 김현진
 *  연결 테이블 명 : Ord_dtl
 *  테이블 물리명 : 주문상세
 */

public class OrdDetailVO {
	
	
	
//	Ordtl_cd		주문상세코드 PK
	private String ordtl_cd;
	
//	Ord_cd			주문코드 FK Orders.ord_cd
	private String ord_cd;
//	Prdt_cd			완제품코드 FK Prod_prod_cd
	private String prdt_cd;
//	Ord_qty			수량
	private int ord_qty;
	
}
