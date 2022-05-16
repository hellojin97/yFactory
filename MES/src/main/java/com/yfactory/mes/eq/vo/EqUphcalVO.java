package com.yfactory.mes.eq.vo;

import java.sql.Date;

import lombok.Data;

/*
 *  등록일자 : 2022-05-15
 *  등록자    : 김세명
 *  연결 테이블 명 : EQ_UPHCAL
 *  테이블 물리명 : 실시간 설비 상태
 */

@Data
public class EqUphcalVO {
	//CAL_DT		계산일자	PK
	private Date cal_dt;
	//EQ_CODE		설비코드	FK	EQ.EQ_CD !!팀장한테 이름 왜 다른지 물어보기
	private String eq_code;
	//ACT_TIME		가동시간
	private Date act_time;
	//OUTPUT_QTY	산출량
	private int output_qty;
	//EQ_UPH		UPH
	private int eq_uph;
}
