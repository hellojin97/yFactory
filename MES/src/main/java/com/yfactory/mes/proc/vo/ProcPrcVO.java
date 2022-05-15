package com.yfactory.mes.proc.vo;

import java.sql.Timestamp;

import lombok.Data;

/*
 *  등록일자 : 2022-05-15
 *  등록자    : 김세명
 *  연결 테이블 명 : PROC_PRC
 *  테이블 물리명 : 진행공정관리
 */
@Data
public class ProcPrcVO {
	//PROC_PRCD		진행공정코드	PK
	private String proc_prcd;
	//LINE_TURN		순번			PK
	private int line_turn;
	//PRD_DTLCD		생산지시상세코드	FK	PRD_INSDTL.PRD_DTLCD
	private String prd_dtlcd;
	//PROC_CD		공정코드		FK	PROCESS.PROC_CD
	private String proc_cd;
	//PROC_STTM		작업시작시간
	private Timestamp proc_sttm;
	//PROC_EDTM		작업종료시간
	private Timestamp proc_edtm;
	//PROC_MGR		관리자		FK	EMPLOYEE.emp_no
	private int proc_mgr;
	//PROC_QTY		투입량
	private int proc_qty;
}
