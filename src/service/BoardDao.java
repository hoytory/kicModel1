package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Board;
import model.Member;
import util.JdbcConection;

public class BoardDao {
	
	public int nextNum() {
		//boardseq.nextval을 읽어서 데이터로 가져오는 기능을 함.
		Connection con = JdbcConection.getConnection();
		PreparedStatement pstmt = null;
		String sql = "select boardseq.nextval from dual ";
		ResultSet rs = null;

		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			return rs.getInt(1);
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcConection.close(con, pstmt, rs);
		}
		return 0;
	}
	
	public void refStepAdd(int ref, int refstep) {
		
		Connection con = JdbcConection.getConnection();
		PreparedStatement pstmt = null;
		String sql = "update board set refstep = refstep + 1 where ref = ? and refstep > ? ";
		                                          //refstep 증가 및 정렬 관련된 식 ↑

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, ref);
			pstmt.setInt(2, refstep);
			pstmt.executeUpdate();

		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcConection.close(con, pstmt, null);
		} 					
	}
	

	public int insertBoard(Board board) {
		System.out.println(board);
		Connection con = JdbcConection.getConnection();
		PreparedStatement pstmt = null;
		String sql = "insert into board values (?, ?, ?, ?, ?, ?, ?, sysdate, ?, 0, ?, ?, ? )";
		//column name을 생략하면 create table column 순으로 입력한다. 

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, board.getNum());
			pstmt.setString(2, board.getWriter());
			pstmt.setString(3, board.getPass());
			pstmt.setString(4, board.getSubject());
			pstmt.setString(5, board.getContent());
			pstmt.setString(6, board.getFile1());
			pstmt.setString(7, board.getBoardid());
			pstmt.setString(8, board.getIp());
			pstmt.setInt(9, board.getRef());
			pstmt.setInt(10, board.getReflevel());
			pstmt.setInt(11, board.getRefstep());
			return pstmt.executeUpdate();	
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcConection.close(con, pstmt, null);
		} return 0;
	}

	public int boardCount(String boardId) {
		Connection con = JdbcConection.getConnection();
		PreparedStatement pstmt = null;
		String sql = "select count(*) from board where boardid = ?";
		ResultSet rs = null;
		//column name을 생략하면 create table column 순으로 입력한다. 

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, boardId);
			rs = pstmt.executeQuery();
			rs.next();
			return rs.getInt(1);	
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcConection.close(con, pstmt, rs);
		} 
		return 0;	
	}

	public List<Board> boardList(int pageInt, int limit, int boardcount, String boardId) {
		Connection con = JdbcConection.getConnection();
		PreparedStatement pstmt = null;
		String sql = " select * from( " + 
				" select rownum rnum, a.* from( " + 
				" select * from board where boardid = ? " +
				" order by ref desc, refstep asc) a) " +
				" where rnum BETWEEN ? and ? ";
		//(pageInt-1)*limit + 1 + limit -1
		ResultSet rs = null;
		List<Board> list = new ArrayList<>();

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, boardId);
			pstmt.setInt(2, (pageInt-1)*limit + 1);
			pstmt.setInt(3, pageInt*limit);
			rs = pstmt.executeQuery();

			while(rs.next()) {
				Board b = new Board();
				b.setNum(rs.getInt("num"));
				b.setWriter(rs.getString("writer"));
				b.setPass(rs.getString("pass"));
				b.setSubject(rs.getString("subject"));
				b.setContent(rs.getString("content"));
				b.setFile1(rs.getString("file1"));
				b.setRef(rs.getInt("ref"));
				b.setRefstep(rs.getInt("refstep"));
				b.setReflevel(rs.getInt("reflevel"));
				b.setReadcnt(rs.getInt("readcnt"));
				b.setRegdate(rs.getDate("regdate"));
				list.add(b);			
			}
			return list;

		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcConection.close(con, pstmt, rs);
		} 
		return list;	
	}

	public Board boardOne(int num) {
		Connection con = JdbcConection.getConnection();
		PreparedStatement pstmt = null;
		String sql = "select * from board where num = ?";
		ResultSet rs = null;
		//column name을 생략하면 create table column 순으로 입력한다. 

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Board b = new Board();
				b.setNum(rs.getInt("num"));
				b.setWriter(rs.getString("writer"));
				b.setPass(rs.getString("pass"));
				b.setSubject(rs.getString("subject"));
				b.setContent(rs.getString("content"));
				b.setFile1(rs.getString("file1"));
				b.setRef(rs.getInt("ref"));
				b.setRefstep(rs.getInt("refstep"));
				b.setReflevel(rs.getInt("reflevel"));
				b.setReadcnt(rs.getInt("readcnt"));
				b.setRegdate(rs.getDate("regdate"));
				return b;			
			}

		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcConection.close(con, pstmt, rs);
		} 
		return null;	
	}

	public int boardUpdate(Board board) {
		Connection con = JdbcConection.getConnection();
		PreparedStatement pstmt = null;
		String sql = "update board set subject = ?, content = ?, file1 = ? "
				+ " where num = ? ";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, board.getSubject());
			pstmt.setString(2, board.getContent());
			pstmt.setString(3, board.getFile1());
			pstmt.setInt(4, board.getNum());
			return pstmt.executeUpdate();

		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcConection.close(con, pstmt, null);
		} 			
		return 0;	
	}

	public void readCountUp(int num) {
		Connection con = JdbcConection.getConnection();
		PreparedStatement pstmt = null;
		String sql = "update board set readcnt = readcnt + 1 where num = ? ";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();


		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcConection.close(con, pstmt, null);
		} 

	}

	public int boardDelete(int num) {
		Connection con = JdbcConection.getConnection();
		PreparedStatement pstmt = null;
		String sql = "delete from board where num = ? ";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			return pstmt.executeUpdate();


		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcConection.close(con, pstmt, null);
		}
		return 0;

	}


}//class end
