package com.project.trip.item.vo;

import lombok.Data;

@Data
public class ReviewReplyVO {
	private int replyNum;
	private String content;
	private String createDate;
	private int reviewNum;
	private String writer;
	private String memName;

}
