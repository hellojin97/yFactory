package com.yfactory.mes.proc.vo;

import lombok.Data;

/*
 *  등록일자 : 2022-05-15
 *  등록자    : 김세명
 *  연결 테이블 명 : LINE
 *  테이블 물리명 : 라인
 */
@Data
public class LineVO {
	//LINE_CD	라인코드	PK
	private String line_cd;
	//LINE_TURN	순번		PK
	private int	line_turn;
	//PROC_CD	공정코드	FK		PROCESS.PROC_CD
	private String proc_cd;
	//PROD_CD	완제품코드	FK		PROD.PROD_CD
	private String prod_cd;
}
