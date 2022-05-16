package com.yfactory.mes.quality.vo;


import lombok.Data;

/*
 *  등록일자 : 2022-05-15
 *  등록자    : 김현진
 *  연결 테이블 명 : ERR_CODE
 *  테이블 물리명 : 불량코드
 */

@Data
public class ErrCodeVO {
//	err_cd			불량코드		PK
	private String err_cd;

//	err_nm			불량명
	private String err_nm;

//	err_dtl			상세내용
	private String err_dtl;
}
