package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDAO {
	
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	
	public void getCon() {
		
		try {
			Context initctx = new InitialContext();
			Context envctx = (Context)initctx.lookup("java:comp/env");
			
			DataSource ds = (DataSource) envctx.lookup("jdbc/pool");
			con = ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	//전체 게시글 갯수 보여주는 메소드 
	public int getAllCount() {
		getCon();
		int count=0;
		try {
			
			String sql = "select count(*) from board";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				count=rs.getInt(1);
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}
	
	public Vector<BoardBean> getAllBoard(int startRow , int endRow){
		
		getCon();
		Vector<BoardBean> v = new Vector<BoardBean>();
		
		try {
			String sql = "select * from (select A.* , Rownum Rnum from (select * from board order by ref desc, re_step asc)A) where Rnum >= ? and Rnum <= ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				//데이터를 패키징 해줌(가방 = BoardBean)
				BoardBean bean = new BoardBean();
				bean.setNum(rs.getInt(1));
				bean.setWriter(rs.getString(2));
				bean.setEmail(rs.getString(3));
				bean.setSubject(rs.getString(4));
				bean.setPassword(rs.getString(5));
				bean.setReg_date(rs.getDate(6).toString());
				bean.setRef(rs.getInt(7));
				bean.setRe_step(rs.getInt(8));
				bean.setRe_level(rs.getInt(9));
				bean.setReadcount(rs.getInt(10));
				bean.setContent(rs.getString(11));
				
				v.add(bean);
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return v;
	}
	
	public void insertBoard(BoardBean dbean) {
		
		getCon();
		int ref = 0;
		int re_step = 1;
		int re_level = 1;
		try {
			String refSql = "select max(ref) from board";
			pstmt = con.prepareStatement(refSql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				ref = rs.getInt(1) + 1;
			}
			
			
			String sql = "insert into board values (board_seq.nextval,?,?,?,?,sysdate,?,?,?,0,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dbean.getWriter());
			pstmt.setString(2, dbean.getEmail());
			pstmt.setString(3, dbean.getSubject());
			pstmt.setString(4, dbean.getPassword());
			pstmt.setInt(5, ref);
			pstmt.setInt(6, re_step);
			pstmt.setInt(7, re_level);
			pstmt.setString(8, dbean.getContent());
			
			pstmt.executeUpdate();
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//게시글 한 개의 정보 가져오는 메소드
	public BoardBean getOneBoard(int num) {
		getCon();
		BoardBean dbean = null;
		try {
			
			//조회수 증가
			String countSql = "update board set readcount = readcount + 1 where num = ?";
			pstmt = con.prepareStatement(countSql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			
			String sql = "select * from board where num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				 dbean = new BoardBean();
				dbean.setNum(rs.getInt(1));
				dbean.setWriter(rs.getString(2));
				dbean.setEmail(rs.getString(3));
				dbean.setSubject(rs.getString(4));
				dbean.setPassword(rs.getNString(5));
				dbean.setReg_date(rs.getString(6).toString());
				dbean.setRef(rs.getInt(7));
				dbean.setRe_step(rs.getInt(8));
				dbean.setRe_level(rs.getInt(9));
				dbean.setReadcount(rs.getInt(10));
				dbean.setContent(rs.getString(11));

				
			}
			con.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dbean;
	}
	
	public void insertReBoard(BoardBean dbean) {
		
		getCon();
		
		try {
			String levelSql = "update board set re_level = re_level + 1 where ref = ? and re_level > ?";
			pstmt = con.prepareStatement(levelSql);
			pstmt.setInt(1, dbean.getRef());
			pstmt.setInt(2, dbean.getRe_level());
			pstmt.executeUpdate();
			
			
			String sql = "insert into board values (board_seq.nextval,?,?,?,?,sysdate,?,?,?,0,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dbean.getWriter());
			pstmt.setString(2, dbean.getSubject());
			pstmt.setString(3, dbean.getEmail());
			pstmt.setString(4, dbean.getPassword());
			pstmt.setInt(5, dbean.getRef());
			pstmt.setInt(6, dbean.getRe_step()+1);	
			pstmt.setInt(7, dbean.getRe_level()+1);
			pstmt.setString(8, dbean.getContent());
			
			pstmt.executeUpdate();
			
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
}
