package com.yfactory.mes.eq.vo;

import lombok.Data;

/*
 *  등록일자 : 2022-05-17
 *  등록자    : 김진환
 *  연결 테이블 명 : EQ_PROC
 *  테이블 물리명 : 설비별 공정
 */
@Data
public class EqProcVO {
//	EQ_CD		설비코드		PK
	private String eq_cd; 
//	PROC_CD		공정코드		PK
	private String proc_cd;
}
