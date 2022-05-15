package com.yfactory.mes.quality.vo;

import java.sql.Date;

import lombok.Data;

/*
 *  등록일자 : 2022-05-15
 *  등록자    : 김현진
 *  연결 테이블 명 : MT_CHK
 *  테이블 물리명 : 자재검사
 */

@Data
public class MtCheckVO {
//	po_dtlcd		발주상세코드		PK FK	MT_PODTL.po_dtlcd
	private String po_dtlcd;
//	Mtrl_cd			자재코드			FK 		MT.mt_cd
	private String mtrl_cd;
//	chk_dt			검사일자
	private Date chk_dt;
//	chk_passqty		합격량
	private int chk_passqty;
//	chk_errqty		불량량
	private int chk_errqty;
//	chk_mngr		담당자			FK		EMPLOYEE.emp_no
	private int chk_mngr;
//	chk_insp		검사여부			FK		COMM_CODE.comm_cd
	private String chk_insp;

}
