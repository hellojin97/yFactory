package com.yfactory.mes.proc;

/*
 *  등록일자 : 2022-05-15
 *  등록자    : 김세명
 *  연결 테이블 명 : PRD_INS
 *  테이블 물리명 : 생산지시
 */

public class PrdInsVO {
	//INS_CD	생산지시코드 PK
	private String ins_cd;
	//PD_CD		생산계획상세코드	FK	PLAN_DTL.PD_CD
	private String pd_cd;
	//PP_CD		생산계획코드	FK	PLAN_DTL.PP_CD
	private String pp_cd;
	//INS_ST	생산지시상태	FK	COMM_CODE.COMM_CD
	private String ins_st;
}
