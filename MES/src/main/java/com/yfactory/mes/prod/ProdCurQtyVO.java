package com.yfactory.mes.prod;

import lombok.Data;

/*
 *  등록일자 : 2022-05-15
 *  등록자    : 김현진
 *  연결 테이블 명 : Prod_curqty
 *  테이블 물리명 : 완제품 현재고
 */

@Data
public class ProdCurQtyVO {
//	prod_lot		완제품 LOT		PK & FK PROD_LOT.prod_lot
	private String prod_lot;
//	prod_qty		수량
	private int prdo_qty;

}
