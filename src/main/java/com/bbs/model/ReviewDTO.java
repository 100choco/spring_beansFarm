package com.bbs.model;

import java.util.Date;

import lombok.Data;

@Data
public class ReviewDTO {
		private Long r_no;	// 후기번호
		private Long m_no;	// 회원번호
		private Long order_no;	// 주문번호
		private String r_title;
		private String r_content;
		private int r_star;
		private String r_view_cont;
		private Date r_reg_date;
		private String r_photo;	// 후기사진 
		private String r_thumbnail;
}
