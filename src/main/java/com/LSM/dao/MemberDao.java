package com.LSM.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.LSM.dto.MemberDto;


public class MemberDao {
	
	private String driverName = "com.mysql.jdbc.Driver"; //MySQL JDBC 드라이버 이름
	private String url = "jdbc:mysql://localhost:3306/jspdb"; //MySQL이 설치된 서버의 주소(ip)와 연결할 DB(스키마) 이름		
	private String username = "root";
	private String password = "12345";	
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	int sqlResult =0;
	MemberDto memberDto = new MemberDto();
	
	public int loginCheck(String mid, String mpw)	{ //로그인 성공 여부를 반환하는 메소드
		String sql = "SELECT * FROM members WHERE memberid=? AND memberpw=?"; //테이블,모두 일치해야함-> and
		try {
			Class.forName(driverName); //MySQL 드라이버 클래스 불러오기			
			conn = DriverManager.getConnection(url, username, password);
			//커넥션이 메모리 생성(DB와 연결 커넥션 conn 생성)
			
			pstmt = conn.prepareStatement(sql); //pstmt 객체 생성(sql 삽입)			
			pstmt.setString(1, mid);
			pstmt.setString(2, mpw);
			rs = pstmt.executeQuery(); //해당 번호글의 레코드 1개 또는 0개가 반환
			
			if(rs.next()) {
				sqlResult = 1;
			}	else {
				sqlResult = 0;
			}
			
		} catch (Exception e) {
			System.out.println("DB 에러 발생! ");
			e.printStackTrace(); //에러 내용 출력
		} finally { //에러의 발생여부와 상관 없이 Connection 닫기 실행 
			try {
				if(rs != null) { //rs가 null 이 아니면 닫기(pstmt 닫기 보다 먼저 실행)
					rs.close();
				}				
				if(pstmt != null) { //stmt가 null 이 아니면 닫기(conn 닫기 보다 먼저 실행)
					pstmt.close();
				}				
				if(conn != null) { //Connection이 null 이 아닐 때만 닫기
					conn.close();
				}
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		return sqlResult;
	}
	
	// 1. 아이디 중복 체크 메서드
    public int idCheck(String userId) {
        String sql = "SELECT COUNT(*) FROM members WHERE memberid = ?";
        int count = 0;
        
        try {
            Class.forName(driverName);
            conn = DriverManager.getConnection(url, username, password);
            
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, userId);
            
            rs = pstmt.executeQuery();
            
            if (rs.next()) {
                count = rs.getInt(1); // COUNT(*)의 결과 값을 가져옴
            }
        } catch (Exception e) {
            e.printStackTrace();
        } 
       
        return count; // 아이디가 존재하면 1, 아니면 0 반환
    }

    // 2. 회원 정보 저장 메서드
    public int insertMember(String userId, String userPw, String name, String email) {
        String sql = "INSERT INTO members (memberid, memberpw, membername, memberemail) VALUES (?, ?, ?, ?)";
        int result = 0;
        
        try {
            Class.forName(driverName);
            conn = DriverManager.getConnection(url, username, password);
            
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, userId);
            pstmt.setString(2, userPw);
            pstmt.setString(3, name);
            pstmt.setString(4, email);
            
            result = pstmt.executeUpdate(); // 실행된 쿼리의 행(row) 수를 반환 (성공 시 1)
        } catch (Exception e) {
            e.printStackTrace();
        } 
        
        return result; // 성공적으로 삽입되면 1, 실패하면 0을 반환   
    }
    public MemberDto getMemberinfo(String memberId) {
        MemberDto memberDto = null;
        String sql = "SELECT memberid, memberpw, membername, memberemail FROM members WHERE memberid=?";
        
        try {
            Class.forName(driverName);
            conn = DriverManager.getConnection(url, username, password);
            
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, memberId);
            
            rs = pstmt.executeQuery();
            
            if (rs.next()) {
            	memberDto = new MemberDto();
                memberDto.setMemberid(rs.getString("memberid"));
                memberDto.setMemberpw(rs.getString("memberpw"));
                memberDto.setMembername(rs.getString("membername"));
                memberDto.setMemberemail(rs.getString("memberemail"));
              
            }
        } catch (Exception e) {
            e.printStackTrace();
        } 
       
        return memberDto;
    }
    
    public int updateMember(String memberId, String newPassword, String email) {
        int result = 0;
        String sql;

        try {
            Class.forName(driverName);
            conn = DriverManager.getConnection(url, username, password);

            // 새 비밀번호가 입력되었으면 비밀번호 + 이메일 업데이트
            if (newPassword != null && !newPassword.trim().isEmpty()) {
                sql = "UPDATE members SET memberpw=?, memberemail=? WHERE memberid=?";
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, newPassword);
                pstmt.setString(2, email);
                pstmt.setString(3, memberId);
            } else {
                // 비밀번호 변경 안했으면 이메일만 업데이트
                sql = "UPDATE members SET memberemail=? WHERE memberid=?";
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, email);
                pstmt.setString(2, memberId);
            }

            result = pstmt.executeUpdate(); // 성공 시 1 반환

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return result; // 성공 시 1, 실패 시 0
    }
   
    
    
}	
	

