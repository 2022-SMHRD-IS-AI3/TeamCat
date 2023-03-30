package com.smhrd.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.ToString;

@Getter
@RequiredArgsConstructor
@AllArgsConstructor
@ToString

public class RentDTO {

	private int r_idx;
	private int p_idx;
	private int user_idx;
	private String r_status;
	private String r_start_date;
	private String r_end_date;
	private String return_chk;
	private String return_date;
	private int rv_idx;
	
	
	public RentDTO(int p_idx, int user_idx) {
		
		this.p_idx = p_idx;
		this.user_idx = user_idx;
	}


	
	
	
	
}
