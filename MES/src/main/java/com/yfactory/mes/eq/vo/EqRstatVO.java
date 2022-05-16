package com.yfactory.mes.eq.vo;

import java.sql.Date;

import lombok.Data;

/*
 *  등록일자 : 2022-05-15
 *  등록자    : 김세명
 *  연결 테이블 명 : EQ_RSTAT
 *  테이블 물리명 : 실시간 설비 상태
 */

@Data
public class EqRstatVO {
	//PROC_LOG		LOG시간		PK
	private Date proc_log;
	//EQ_CD			설비코드		FK	EQ.EQ_CD
	private String eq_cd;
	//EQ_RTMP		실시간 온도
	private int eq_rtmp;
	//EQ_RPRDQ		실시간 생산량
	private int eq_rprdq;
	//EQ_ERRQTY		불량량
	private int eq_errqty;	
}
