package com.project.food.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.project.util.JdbcUtil;


public class FoodDAO {
	
	private static FoodDAO instance = new FoodDAO();
	
	private DataSource dataSource;
	
	private FoodDAO() {
		
		try {
			InitialContext init = new InitialContext();
			dataSource = (DataSource)init.lookup("java:comp/env/jdbc/oracle");
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("food 드라이버 호출과정에서 오류가 발생하였습니다.");
		}
	}
	
	public static FoodDAO getInstance() {
		return instance;
	}
	
	public ArrayList<FoodVO> getList(String category){
		
		ArrayList<FoodVO> list = new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT * FROM FOOD WHERE FOOD_CATEGORY = ?";
		
		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, category);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				String foodnum = rs.getString("FOOD_NUM");
				String foodname = rs.getString("FOOD_NAME");
				String foodprice = rs.getString("FOOD_PRICE");
				String foodcategory = rs.getString("FOOD_CATEGORY");
				String foodImgPath = rs.getString("FOOD_IMG_PATH");
				
				FoodVO vo = new FoodVO(foodnum, foodname, foodprice, foodcategory, foodImgPath);
				list.add(vo);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.close(conn, pstmt, rs);
		}
		return list;
	}
	
	public void inSert(String name, String price) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		String sql = "INSERT INTO ORDER_LIST VALUES(?, ?, SEQ1.NEXTVAL)";
		
		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, price);
			
			pstmt.executeUpdate();
			
			
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("insert 과정 중 장애 발생");
		}finally {
			JdbcUtil.close(conn, pstmt, null);
		}
	}
	
	public ArrayList<BucketVO> foodList() {
		ArrayList<BucketVO> list = new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from order_list order by order_num";
		
		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String order_Num = rs.getString("ORDER_NUM");
				String food_Name = rs.getString("food_name");
				String order_Price = rs.getString("order_price");
				
				BucketVO vo = new BucketVO(order_Num, food_Name, order_Price);
				
				list.add(vo);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn, pstmt, rs);
		}
		return list;
		
	}
	
	public void order () {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "DELETE FROM ORDER_LIST";
		
		try {
			
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.executeUpdate();
			
			System.out.println("order구문 실행 가능");
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("order구문 실행 불가");
		} finally {
			JdbcUtil.close(conn, pstmt, null);
		}
				
	}
	
	
}
