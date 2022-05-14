package com.yfactory.mes.mtrl.vo;

import java.sql.Date;

import lombok.Data;

/*
 *  등록일자 : 2022-05-15
 *  등록자    : 김현진
 *  연결 테이블 명 : Mt_lot
 *  테이블 물리명 : 원자재 Lot
 */

@Data
public class MtLotVO {
//	mt_lot		원자재 LOT		PK
	private String mt_lot;
//	mt_cd		자재코드			FK	MT.mt_cd
	private String mt_cd;
//	mt_exp		유통기한
	private Date mt_exp;
//	mt_wdt		입고일자
	private Date mt_wdt;
	
}
