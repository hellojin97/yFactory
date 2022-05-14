package com.yfactory.mes.common.vo;

import java.sql.Date;



/*
 *  등록일자 : 2022-05-14
 *  등록자    : 김현진
 *  연결 테이블 명 : Comm_code
 *  테이블 물리명 : 공통코드
 */


public class CommVO {

	
//	Comm_cd  	공통코드 PK
	private String comm_cd;
//	Hcomm_cd	상위공통코드 fk Comm_cd
	private String hcomm_cd;
//	Cd_nm		코드명
	private String cd_nm;
//	Cd_explan	코드설명
	private String cd_explan;
//	Cd_ins_tm	등록일자
	private Date cd_ins_tm;
//	Cd_upd_tm	수정일자
	private Date cd_upd_tm;
	
}
