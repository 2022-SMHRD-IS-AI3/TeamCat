package com.smhrd.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.RequiredArgsConstructor;

@Getter
@AllArgsConstructor
@RequiredArgsConstructor

public class ReviewDTO {

	private int rv_idx;
	private int user_idx;
	private String thumbs_flag;
	private String rv_contents;
	private int rp_flag;
	private int rp_idx;
	private String rv_nick; // 받은사람
	private String rp_nick; // 보낸사람
	
}
