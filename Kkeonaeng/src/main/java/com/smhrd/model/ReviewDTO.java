package com.smhrd.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@Getter
@AllArgsConstructor
@RequiredArgsConstructor

public class ReviewDTO {

	@NonNull private int rv_idx;
	@NonNull private int user_idx;
	@NonNull private String thumbs_flag;
	@NonNull private String rv_contents;
	@NonNull private int rp_flag;
	@NonNull private int rp_idx;
	private String rv_nick; // 받은사람
	private String rp_nick; // 보낸사람
	
}
