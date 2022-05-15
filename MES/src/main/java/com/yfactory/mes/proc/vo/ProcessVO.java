package com.yfactory.mes.proc.vo;

import lombok.Data;

/*
 *  등록일자 : 2022-05-15
 *  등록자    : 김세명
 *  연결 테이블 명 : PROCESS
 *  테이블 물리명 : 공정
 */
@Data
public class ProcessVO {
	//PROC_CD	공정코드	PK
	private String proc_cd;
	//EQ_CD		설비코드	FK	EQ.EQ_CD;
	private String eq_dd;
	//PROC_NM	공정명
	private String proc_nm;
}
