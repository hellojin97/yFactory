package com.yfactory.mes.prod;

import java.sql.Date;

import lombok.Data;

/*
 *  등록일자 : 2022-05-15
 *  등록자    : 김현진
 *  연결 테이블 명 : Prod_lot
 *  테이블 물리명 : 완제품 LOT
 */

@Data
public class ProdLotVO {
//	prod_lot		완제품 LOT	PK
	private	String prod_lot;
//	prod_cd			완제품명		FK		PROD.prod_cd
	private String prod_cd;
//	prod_exp		유통기한
	private Date prod_exp;
//	prod_fdt		제통기한
	private Date prod_fdt;
}
