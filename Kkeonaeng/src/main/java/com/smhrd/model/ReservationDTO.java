package com.smhrd.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@AllArgsConstructor
@RequiredArgsConstructor
@Getter
public class ReservationDTO {
	
	@NonNull private int rv_idx;
	@NonNull private int user_idx; // 예약자
	@NonNull private int p_idx;
	private String rv_start_date;
	private String rv_end_date;
}