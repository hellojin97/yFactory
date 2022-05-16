package com.yfactory.mes.common.vo;

import lombok.Data;

/*
 *  등록일자 : 2022-05-14
 *  등록자    : 김현진
 *  연결 테이블 명 : Dept
 *  테이블 물리명 : 부서
 */

@Data
public class DeptVO {

//	Dept_no		부서번호 PK
	private int dept_no;
//	Dept_nm		부서명
	private String dept_nm;
	
}
