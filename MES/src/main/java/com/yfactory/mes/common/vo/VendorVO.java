package com.yfactory.mes.common.vo;

/*
 *  등록일자 : 2022-05-14
 *  등록자    : 김현진
 *  연결 테이블 명 : Vendor
 *  테이블 물리명 : 업체
 */

public class VendorVO {
	
//	Vdr_cd		업체코드 PK
	private String vdr_cd;
//	Ven_cd		업체구분코드 FK Comm_code.comm_cd
	private String ven_cd;
//	Vdr_nm		업체명
	private String vdr_nm;
//	Vdr_eid		사업자등록번호
	private String vdr_eid;
//	Vdr_tel		전화번호
	private String vdr_tel;
//	Vdr_mgr		담당자명
	private String vdr_mgr;
}
