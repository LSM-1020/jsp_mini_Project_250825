package com.LSM.dto;

public class ConcertDto {

	private int reservationid;
	private String memberid;
	private String concertid;
	private int ticketcount;
	private String reservedate;
	private String nowdate;
	public ConcertDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ConcertDto(int reservationid, String memberid, String concertid, int ticketcount, String reservedate,
			String nowdate) {
		super();
		this.reservationid = reservationid;
		this.memberid = memberid;
		this.concertid = concertid;
		this.ticketcount = ticketcount;
		this.reservedate = reservedate;
		this.nowdate = nowdate;
	}
	public int getReservationid() {
		return reservationid;
	}
	public void setReservationid(int reservationid) {
		this.reservationid = reservationid;
	}
	public String getMemberid() {
		return memberid;
	}
	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}
	public String getConcertid() {
		return concertid;
	}
	public void setConcertid(String concertid) {
		this.concertid = concertid;
	}
	public int getTicketcount() {
		return ticketcount;
	}
	public void setTicketcount(int ticketcount) {
		this.ticketcount = ticketcount;
	}
	public String getReservedate() {
		return reservedate;
	}
	public void setReservedate(String reservedate) {
		this.reservedate = reservedate;
	}
	public String getNowdate() {
		return nowdate;
	}
	public void setNowdate(String nowdate) {
		this.nowdate = nowdate;
	}
	
		
	
}
