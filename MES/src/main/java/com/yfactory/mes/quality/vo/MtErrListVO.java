package com.yfactory.mes.quality.vo;


import lombok.Data;

/*
 *  등록일자 : 2022-05-15
 *  등록자    : 김현진
 *  연결 테이블 명 : MT_ERRLIST
 *  테이블 물리명 : 자재불량내역
 */

@Data
public class MtErrListVO {
//	po_dtlcd		발주상세코드		PK FK	MT_PODTL.po_dtlcd
	private String po_dtlcd;
//	mtrl_cd			자재코드			FK		MT.mt_cd
	private String mtrl_cd;
//	chk_errqty		불량량
	private int chk_errqty;
//	err_cd			불량코드			FK		ERR_CODE.err_cd
	private String err_cd;
}
