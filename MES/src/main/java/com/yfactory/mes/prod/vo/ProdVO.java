package com.yfactory.mes.prod.vo;

import lombok.Data;

/*
 *  등록일자 : 2022-05-14
 *  등록자    : 김현진
 *  연결 테이블 명 : Prod
 *  테이블 물리명 : 완제품
 */

@Data
public class ProdVO {
//	Prod_cd			완제품코드	PK
	private String prod_cd;
//	Prod_nm			제품명
	private String prod_nm;
//	Prod_unit		단위
	private String unit;
//	Prod_saqty		안전재고
	private int prod_saqty;
//	uuid			FK		Img_attach.uuid
	private String uuid;
}
