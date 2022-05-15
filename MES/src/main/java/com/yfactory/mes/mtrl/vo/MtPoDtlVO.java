package com.yfactory.mes.mtrl.vo;

import java.sql.Date;

import lombok.Data;

/*
 *  등록일자 : 2022-05-15
 *  등록자    : 김현진
 *  연결 테이블 명 : Mt_podtl
 *  테이블 물리명 : 원자재 발주 상세
 */

@Data
public class MtPoDtlVO {
//	po_dtlcd		발주상세코드		PK
	private String po_dtlcd;
//	po_cd			발주코드			FK	MT_PO.po_cd
	private String po_cd;
//	mt_cd			자재코드			FK	MT.mt_cd
	private String mt_cd;
//	mt_prc			단가	
	private int mt_prc;
//	po_qty			발주량
	private int po_qty;
//	po_reqdt		납기요청일
	private Date po_reqdt;
}
