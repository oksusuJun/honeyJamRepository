package com.honeyjam.board.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class InsertItem_tbBatch {

	public static void main(String[] args) throws Exception{
		
		String sql = "INSERT INTO item_tb values(item_tb_num_seq.nextval, ?)"; 
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:XE", "scott", "tiger");
			pstmt = conn.prepareStatement(sql);
			for(int i = 1; i < 10000; i++){
				pstmt.setString(1, "Item "+i);
				pstmt.addBatch();
			}
			pstmt.executeBatch();
			System.out.println("완료");
		}finally {
			if(pstmt != null)pstmt.close();
			if(conn != null) conn.close();
		}

	}

}
