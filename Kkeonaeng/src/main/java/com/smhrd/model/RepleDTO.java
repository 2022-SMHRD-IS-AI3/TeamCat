package com.smhrd.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.RequiredArgsConstructor;

@Getter
@AllArgsConstructor
@RequiredArgsConstructor
public class RepleDTO {

	private int rp_idx;
	private int p_idx;
	private int user_idx;
	private String reple_con;
	private int rp_reg_date;
}
