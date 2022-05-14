package com.yfactory.mes.common.vo;



/*
 *  등록일자 : 2022-05-14
 *  등록자    : 김현진
 *  연결 테이블 명 : Employee
 *  테이블 물리명 : 사원
 */

public class EmployeeVO {
	
//	Emp_no		사원번호  PK
	private int emp_no;
//	Dept_no		부서번호 FK	dept.dept_no
	private int dept_no;
//	Emp_nm		사원명
	private String emp_nm;
//	Emp_email	이메일
	private String emp_email;
//	pw			비밀번호
	private String pw;

}
