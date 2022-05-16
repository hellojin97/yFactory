package com.yfactory.mes.proc.vo;

import java.sql.Date;

import lombok.Data;

/*
 *  등록일자 : 2022-05-15
 *  등록자    : 김세명
 *  연결 테이블 명 : PRDT_PL
 *  테이블 물리명 : 생산계획
 */
@Data
public class PrdtPlVO {

	//PP_CD		생산계획코드 PK
	private String pp_cd;
	//ORD_CD	주문코드	FK ORDERS.ORD_CD
	private	String ord_cd;
	//PP_NM		계획명
	private	String pp_nm;
	//PP_DT		계획일자
	private	Date pp_dt;
	//PP_PROG	계획진행상태 FK COMM_CODE.COMM_CD
	private String pp_prog;
	
}
