package com.user;

import javax.crypto.Cipher;
import java.security.Key;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;


public class userDAO {
    private Connection conn;
    private PreparedStatement pstmt;
    private ResultSet rs;

    private static String algorithm = "DESede";
    private static Key Key = null;
    private static Cipher cipher = null;

    public userDAO() {
        try {
            String dbURL = "jdbc:mysql://13.209.103.1:3306/member?useSSL=false";
            String dbID = "dope";
            String dbPassword = "aksekfxn1";
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public int login(String userID, String userPwd){
        pstmt = null;
        rs = null;
        String SQL = "SELECT * FROM USER WHERE userID = ?";
        try {
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, userID);
            rs = pstmt.executeQuery();
            if(rs.next()) {
                if (rs.getString(2).equals(userPwd)) {
                    return 1; // 로그인 성공
                } else {
                    return 0; // 비밀번호 불일치
                }
            }
            return -1; // 아이디가 없음
        }catch (Exception e){
            e.printStackTrace();
        }
        return -2; // 데이터베이스 오류
    }
//	public userDTO userInfo(String userID) {
	public userDTO userInfo(String userID) {
		pstmt = null;
		rs = null;
		userDTO dto = new userDTO();
		String SQL2 = "SELECT * FROM user WHERE userID = ?";
		try{
			pstmt = conn.prepareStatement(SQL2);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if(rs.next()){
				String userid = rs.getString("userID");
				String username = rs.getString("userName");
				String usernickname = rs.getString("userNickName");
				String userpwd = rs.getString("userPwd");
				dto.setUserID(userid);
				dto.setUserName(username);
				dto.setUserNickName(usernickname);
				dto.setUserPwd(userpwd);
				return dto;
			} else {
				return null;
			}
		} catch (Exception e){
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
			} catch (Exception e){
				e.printStackTrace();
			}
		}
		return dto;
	}

    public int registerCheck(String userID) {
        pstmt = null;
        rs = null;
        String SQL = "SELECT * FROM user WHERE userID = ?";
        try{
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, userID);
            rs = pstmt.executeQuery();
            if(rs.next() || userID.equals("")){
                return 0; // 이미 존재하는 회원
            } else {
                return 1; // 가입 가능한 회원 아이디
            }
        } catch (Exception e){
            e.printStackTrace();
        } finally {
            try {
                if(rs != null) rs.close();
                if(pstmt != null) pstmt.close();
            } catch (Exception e){
                e.printStackTrace();
            }
        }
        return -1; // 데이터베이스 오류
    }
    public int register(String userID, String userPwd, String userName, String userNickName){
        pstmt = null;
        rs = null;
        String SQL = "INSERT INTO user VALUES (?, ?, ?, ?)";
        try{
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, userID);
            pstmt.setString(2, userPwd);
            pstmt.setString(3, userName);
            pstmt.setString(4, userNickName);
            return pstmt.executeUpdate();
        } catch (Exception e){
            e.printStackTrace();
        } finally {
            try {
                if(rs != null) rs.close();
                if(pstmt != null) pstmt.close();
            } catch (Exception e){
                e.printStackTrace();
            }
        }
        return -1; // 데이터베이스 오류
    }

    public ArrayList<userDTO> getMemberAll(){
	    ArrayList<userDTO> list = new ArrayList<userDTO>();
	    try {
		    String SQL = "select * from user";
		    pstmt = conn.prepareStatement(SQL);
		    rs = pstmt.executeQuery();
		    while(rs.next()){
			    userDTO dto =  new userDTO();
			    dto.setUserID(rs.getString("userID"));
			    dto.setUserName(rs.getString("userName"));
			    dto.setUserNickName(rs.getString("userNickName"));
			    dto.setUserPwd(rs.getString("userPwd"));
			    list.add(dto);
		    }
	    } catch (Exception e) {
		    System.out.println("getMemberAll err : ");
	    } finally {
		    try {
			    if(rs!=null)rs.close();
			    if(pstmt!=null)pstmt.close();
			    if(conn!=null)conn.close();
		    } catch (Exception e) {
			    e.printStackTrace();
		    }
	    }
	    return list;
    }
}