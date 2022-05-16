package com.yfactory.mes.eq.vo;

import java.sql.Date;

import lombok.Data;

/*
 *  등록일자 : 2022-05-15
 *  등록자    : 김세명
 *  연결 테이블 명 : EQ_CHK
 *  테이블 물리명 : 점검
 */

@Data
public class EqChkVO {
	//EQ_CHKDT		점검일자	PK
	private Date eq_chkdt;
	//EQ_CD			설비코드	FK	EQ.EQ_CD
	private String eq_cd;
	//EQ_CHKDTL		점검내용
	private String eq_chkdtl;
	//EQ_CHKR		점검인	FK	EMPLOYEE.EMP_NO
	private int eq_chkr;
	//CHK_RSCD		판정코드	FK	COMM_CODE.COMM_CD
	private String chk_rscd;
}
