package com.yfactory.mes.sales.vo;


/*
 *  등록일자 : 2022-05-14
 *  등록자    : 김현진
 *  연결 테이블 명 : Ord_res
 *  테이블 물리명 : 주문출고
 */

public class OrdResVO {

//	Ordtl_cd	주문상세코드	FK	Ord_dtl.ordtl_cd
	private String Ordtl_cd;
//	Prdt_lot	완제품 LOT	FK	Prod_lot.prod_lot
	private String Prod_lot;
}
