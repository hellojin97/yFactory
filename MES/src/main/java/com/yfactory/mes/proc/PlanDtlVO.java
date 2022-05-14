package com.yfactory.mes.proc;

/*
 *  등록일자 : 2022-05-15
 *  등록자    : 김세명
 *  연결 테이블 명 : PLAN_DTL
 *  테이블 물리명 : 생산계획상세
 */

public class PlanDtlVO {
	//PD_CD		생산계획상세코드	PK
	private	String pd_cd;
	//PP_CD		생산계획코드	FK PRDT_PL.PP_CD
	private	String pp_cd;
	//PROD_CD	완제품코드		FK 	PROD.PROD_CD
	private String prod_cd;
	//PD_QTY	계획량
	private int pd_qty;
	//PD_RANK	작업우선순위
	private int pd_rank;
	//PD_DT		생산일수
	private int pd_dt;
}
