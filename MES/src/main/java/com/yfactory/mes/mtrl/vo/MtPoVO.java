package com.yfactory.mes.mtrl.vo;

import java.sql.Date;

import lombok.Data;

/*
 *  등록일자 : 2022-05-15
 *  등록자    : 김현진
 *  연결 테이블 명 : Mt_po
 *  테이블 물리명 : 원자재 발주
 */

@Data
public class MtPoVO {
//	po_cd			발주코드		PK
	private String po_cd;
//	po_reqdt		발주신청일	
	private Date po_reqdt;
//	vdr_cd			업체코드		FK	VENDOR.vdr_cd
	private String vdr_cd; 
//	emp_no			발주인		FK	EMPLOYEE.emp_no
	private int emp_no;
}
