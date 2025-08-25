package com.LSM.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.LSM.dto.ConcertDto;

/**
 * 콘서트 예약 관련 데이터베이스 작업을 처리하는 DAO (Data Access Object) 클래스입니다.
 */
public class ConcertDao {

	private String driverName = "com.mysql.cj.jdbc.Driver"; // JDBC 드라이버 이름 (최신 버전은 cj.jdbc.Driver)
	private String url = "jdbc:mysql://localhost:3306/jspdb?serverTimezone=Asia/Seoul"; // DB URL 및 시간대 설정
	private String username = "root";
	private String password = "12345";
	
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;

	public ConcertDao() {
		try {
			Class.forName(driverName);
		} catch (ClassNotFoundException e) {
			System.err.println("JDBC 드라이버 로드 실패");
			e.printStackTrace();
		}
	}
	
	/**
	 * 새로운 콘서트 예약 정보를 데이터베이스에 삽입합니다.
	 * @param memberId 예약을 진행한 사용자 ID
	 * @param concertId 예약된 콘서트 ID
	 * @param reserveDate 예약 날짜
	 * @param ticketCount 티켓 수량
	 * @return 성공 시 1, 실패 시 0
	 */
	public int reserveConcert(String memberId, String concertId, String reserveDate, int ticketCount) {
		
		String sql = "INSERT INTO reservation (memberid, concertid, ticketcount, reservedate) VALUES (?, ?, ?, ?)";
		int result = 0;
		try {
			conn = DriverManager.getConnection(url, username, password);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberId);
			pstmt.setString(2, concertId);
			pstmt.setInt(3, ticketCount);
			pstmt.setString(4, reserveDate);
			
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.err.println("콘서트 예약 중 DB 에러 발생: " + e.getMessage());
			e.printStackTrace();
		} 
		
		return result;
		
	}

	
	public List<ConcertDto> Reserveinfo(String memberId) {
		String sql = "SELECT row_number() OVER (order by reservationid ASC) AS cno, "
		        + "r.reservationid, m.memberid, r.concertid, r.ticketcount, r.reservedate,r.nowdate "
		        + "FROM reservation r "
		        + "LEFT JOIN members m ON r.memberid = m.memberid "
		        + "WHERE r.memberid = ?"
		        + "ORDER BY cno DESC ";
		List<ConcertDto> reservationList = new ArrayList<>();
		
		try {
			conn = DriverManager.getConnection(url, username, password);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberId);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				ConcertDto concertDto = new ConcertDto();
				concertDto.setReservationid(rs.getInt("reservationid"));
				concertDto.setMemberid(rs.getString("memberid"));
				concertDto.setConcertid(rs.getString("concertid"));
				concertDto.setReservedate(rs.getString("reservedate"));
				concertDto.setTicketcount(rs.getInt("ticketcount"));
				reservationList.add(concertDto);
			}
		} catch (SQLException e) {
			System.err.println("예약 목록 조회 중 DB 에러 발생: " + e.getMessage());
			e.printStackTrace();
		} 
		return reservationList;
	}
	
	
	
}
