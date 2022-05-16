package com.yfactory.mes.mtrl.vo;

import lombok.Data;

/*
 *  등록일자 : 2022-05-15
 *  등록자    : 김현진
 *  연결 테이블 명 : Mt_curqty
 *  테이블 물리명 : 원자재 현재고
 */

@Data
public class MtCurqtyVO {
//	mt_lot		원자재LOT	FK	MT_LOT.mt_lot
	private String mt_lot;
//	mt_qty		수량	
	private int mt_qty;
}
