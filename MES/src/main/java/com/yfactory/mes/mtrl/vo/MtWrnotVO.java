package com.yfactory.mes.mtrl.vo;

import java.sql.Date;

import lombok.Data;

/*
 *  등록일자 : 2022-05-15
 *  등록자    : 김현진
 *  연결 테이블 명 : Mt_wrnote
 *  테이블 물리명 : 원자재 입/출고
 */

@Data
public class MtWrnotVO {
//	mt_num		순번  		PK
	private int mt_num;
//	mt_lot		원자재LOT	FK	MT_LOT.mt_lot
	private String mt_lot;
//	wr_cd		입출고구분	FK	COMM_CODE.comm.comm_cd
	private String wr_cd;
//	mt_wrqty	입/출고량
	private int mt_wrqty;
//	mt_rdt		출고일자
	private Date mt_rdt;
//	mt_note		비고
	private String mt_note;
}
