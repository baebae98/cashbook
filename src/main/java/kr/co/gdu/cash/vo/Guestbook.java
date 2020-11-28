package kr.co.gdu.cash.vo;

import lombok.Data;

@Data //Lombok사용
public class Guestbook {
	private int guestbookId; 
	private String guestbookTitle;
	private String guestbookContent;
	private String guestbookDate;
	private String guestbookWriter;
}
