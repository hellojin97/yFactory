package com.yfactory.mes.quality.vo;


import lombok.Data;

/*
 *  등록일자 : 2022-05-15
 *  등록자    : 김현진
 *  연결 테이블 명 : PROD_ERR
 *  테이블 물리명 : 완제품불량내역
 */

@Data
public class ProdErrListVO {
//	prod_lot		완제품LOT		PK FK PROD_LOT.prod_lot
	private String prod_lot;
//	chk_errqty		불량량
	private int chl_errqty;
//	err_cd			불량코드			FK	  ERR_CODE.err_cd
	private String err_cd;
}
