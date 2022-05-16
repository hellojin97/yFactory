package com.yfactory.mes.bom.vo;

import lombok.Data;

/*
 *  등록일자 : 2022-05-15
 *  등록자    : 김현진
 *  연결 테이블 명 : BOM
 *  테이블 물리명 : Bill Of Material(자재 소요량)
 */

@Data
public class BomVO {
//	Bom_cd		BOM_CD		PK	
	private String bom_cd;
//	Bom_turn	순번			PK
	private int bom_turn;
//	Prod_cd		완제품코드	FK	PROD.prod_cd
	private String prod_cd;
//	mt_cd		자재코드		FK	MT.mt_cd
	private String mt_cd;
//	cs_qty		소모량
	private int cs_qty;
//	proc_cd		공정코드		FK	PROCESS.proc_cd
	private String  proc_cd;
//	step_div	단계구분
	private String step_div;
//	bom_note	비고
	private  String bom_note;
}
