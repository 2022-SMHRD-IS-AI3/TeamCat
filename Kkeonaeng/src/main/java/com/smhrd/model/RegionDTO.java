package com.smhrd.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.RequiredArgsConstructor;

@AllArgsConstructor
@Getter
@RequiredArgsConstructor

public class RegionDTO {

	private int rg_idx;
	private int gu_code;
	private String region;
}
