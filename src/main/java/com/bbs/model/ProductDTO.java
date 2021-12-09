package com.bbs.model;

import java.util.Date;

import lombok.Data;

@Data
public class ProductDTO {
	private long p_no;
	private int category_no;
	private String p_name;
	private int p_price;
	private String p_manufacturer; //제조사
	private int origin_no;
	private String p_image;
	private String p_thumbnail;
	
	private String origin_name;
	
	private String pd_image;
	
	// 마이페이지 내 주문내역 조회시 필요한 변수(컬럼) 추가.
	private Long m_no;
	private Date order_reg_date;
	private Long order_no;
	private int order_price;
	private int product_quantity;
	
	// 제품 상세페이지 내에 리뷰 보이기 위해 필요한 변수(컬럼) 추가.
	private String r_thumbnail;
	private String r_title;
	private String r_content;
	private int r_star;
	
}
