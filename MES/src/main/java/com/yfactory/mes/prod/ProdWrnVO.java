package com.yfactory.mes.prod;

import java.sql.Date;

import lombok.Data;

/*
 *  등록일자 : 2022-05-15
 *  등록자    : 김현진
 *  연결 테이블 명 : Prod_wrnote
 *  테이블 물리명 : 완제품 입/출고
 */

@Data
public class ProdWrnVO {
//	prod_num			순번				PK
	private int prod_num;
//	prod_lot			완제품 LOT 		FK PROD_LOT.prod_lot
	private String prod_lot;
//	wr_cd				입/출고구분		FK COMM_CODE.comm_cd
	private String wr_cd;
//	prod_wrqty			입/출고량
	private int prod_wrqty;
//	prod_rdt			출고일자
	private Date prod_rdt;
//	prod_note			비고
	private String prod_note;
}
