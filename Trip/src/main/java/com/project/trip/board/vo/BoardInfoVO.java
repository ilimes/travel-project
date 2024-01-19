package com.project.trip.board.vo;

import com.project.trip.admin.vo.SideMenuVO;
import lombok.Data;

@Data
public class BoardInfoVO extends SideMenuVO {
	private int boardCode;
	private String sideMenuCode;
	private String title;
	private int displayCnt;
}
