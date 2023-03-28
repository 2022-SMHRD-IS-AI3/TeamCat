package com.smhrd.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NonNull;

@Getter
@AllArgsConstructor
public class WishlistDTO {

	private int w_idx;
	@NonNull private int user_idx;
	@NonNull private int p_idx;
}
