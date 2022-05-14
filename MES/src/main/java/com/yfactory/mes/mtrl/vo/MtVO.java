package com.yfactory.mes.mtrl.vo;

import lombok.Data;

/*
 *  등록일자 : 2022-05-15
 *  등록자    : 김현진
 *  연결 테이블 명 : Mt
 *  테이블 물리명 : 원자재
 */

@Data
public class MtVO {
//	mt_cd			자재코드		PK		
	private String mt_cd;
//	ven_cd			업체코드		FK VENDOR.vdr_cd
	private String ven_cd;
//	mt_nm			자재명
	private String mt_nm;
//	mt_unit			단위
	private String mt_unit;
//	mt_sfqty		안전재고
	private int mt_sfqty;
//	uuid			원자재 이미지			
	private String uuid;
	
}
