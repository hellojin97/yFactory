package com.yfactory.mes.proc.vo;

/*
 *  등록일자 : 2022-05-15
 *  등록자    : 김세명
 *  연결 테이블 명 : PROC_ERR
 *  테이블 물리명 : 공정불량
 */

public class ProcErr {
	//PROC_PRCD		진행공정코드	FK	PROC_PRC.PROC_PRCD
	private String proc_prcd;
	//LINE_TURN		순번			FK	PROC_PRC.LINE_TURN
	private int line_turn;
	//PRD_DTLCD		생산지시상세코드	FK	PROC_PRC.PRD_DTLCD
	private String prd_dtlcd;
	//ERR_CD		불량코드		FK	ERR_CODE.ERR_CD
	private String err_cd;
	//ERR_QTY		불량량
	private int err_qty;
	//ERR_DESC		비고
	private String err_desc;
}
