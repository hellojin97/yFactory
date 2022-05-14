package com.yfactory.mes.proc.vo;

import java.sql.Date;

/*
 *  등록일자 : 2022-05-15
 *  등록자    : 김세명
 *  연결 테이블 명 : PRD_INSDTL
 *  테이블 물리명 : 생산지시상세
 */

public class PrdInsdtlVO {
	//PRD_DTLCD		생산지시상세코드 PK
	private String prd_dtlcd;
	//INS_DTLCD		생산지시코드	FK
	private String ins_dtlcd;
	//INS_QTY		작업지시량
	private int ins_qty;
	//INS_DTLDT		생산지시일자
	private Date ins_dtldt;
	//DAY_RANK		일자별우선순위
	private int day_rank;
	//PRD_NOTE		비고
	private String prd_note;
}
