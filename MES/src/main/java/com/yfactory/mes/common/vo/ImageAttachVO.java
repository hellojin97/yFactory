package com.yfactory.mes.common.vo;

import lombok.Data;

/*
 *  등록일자 : 2022-05-14
 *  등록자    : 김현진
 *  연결 테이블 명 : IMG_ATTACH
 *  테이블 물리명 : 이미지 첨부
 */
@Data
public class ImageAttachVO {
//	uuid				UUID	PK
	private String uuid;
//	img_path		파일경로
	private String img_path;
//	img_nm		파일이름
	private String img_nm;
	
	
// blob 타입으로  파일 경로 저장
	private byte[] blob;
	
	
}
