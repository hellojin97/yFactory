package com.yfactory.mes.eq.vo;

import java.sql.Date;

import lombok.Data;

/*
 *  등록일자 : 2022-05-15
 *  등록자    : 김세명
 *  연결 테이블 명 : EQ_INA
 *  테이블 물리명 : 설비 비가동
 */

@Data
public class EqInaVO {
	//EQ_ACTCD		설비가동코드	PK
	private String eq_actcd;
	//EQ_CD			설비코드		FK	EQ.EQ_CD
	private String eq_cd;
	//EQ_INASD		비가동시작일시
	private Date eq_inasd;
	//EQ_INAED		비가동종료일시
	private Date eq_inaed;
	//DIS_CODE		비가동사유코드	FK	COMM_CODE.COMM_CD
	private String dis_code;
	//EQ_NOTE		비고
	private String eq_note;
}
