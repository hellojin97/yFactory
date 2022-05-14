package com.yfactory.mes.proc.vo;

import java.sql.Date;

/*
 *  등록일자 : 2022-05-15
 *  등록자    : 김세명
 *  연결 테이블 명 : PROC_ST
 *  테이블 물리명 : 공정상태
 */

public class ProcStVO {
	//PROC_LOG		LOG시간		PK
	private	Date proc_log;
	//PROC_PRCD		진행공정코드	FK	PROC_PRC.PROC_PRCD
	private String proc_prcd;
	//LINE_TURN		순번			FK	PROC_PRC.LINE_TURN
	private int line_turn;
	//PRD_DTLCD		생산지시상세코드	FK	PROC_PRC.PRD_DTLCD
	private String prd_dtlcd;
	//PROC_QTY		생산량
	private int proc_qty;
	//PROC_ST		상태
	private String proc_st;
}
