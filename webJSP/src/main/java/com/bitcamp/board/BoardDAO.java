package com.bitcamp.board;

import java.util.ArrayList;
import java.util.List;

public class BoardDAO extends DBConnection {
	//글등록
	public int boardInsert(BoardVO vo) {
		int result=0;
		try {
			dbConn();
			
			sql="insert into board(no, subject, content, userid, ip) "
					+ " values(boardsq.nextval,?,?,?,?)";
			
			pstmt= con.prepareStatement(sql);
			pstmt.setString(1, vo.getSubject());
			pstmt.setString(2, vo.getContent());
			pstmt.setString(3, vo.getUserid());
			pstmt.setString(4, vo.getIp());
			
			result=pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			dbClose();
		}
		
		return result;
	}
	
	//글전체선택
	public List<BoardVO> boardAllRecord() {
		List<BoardVO> list = new ArrayList<BoardVO>();
		try {
			dbConn();
			sql="select no, subject, userid, to_char(writedate,'MM-DD HH:MI') writedate, hit from board order by no desc";
			
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BoardVO vo = new BoardVO();
				vo.setNo(rs.getInt(1));
				vo.setSubject(rs.getString(2));
				vo.setUserid(rs.getString(3));
				vo.setWritedate(rs.getString(4));
				vo.setHit(rs.getInt(5));
				
				list.add(vo);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			dbClose();
		}
		return list;
	}
	
	//글 1개 선택
	public BoardVO oneRecordSelect(int no, int part) {
		BoardVO vo = new BoardVO();
		try {
			//조회수 증가
			if(part==1) { //1:글내용보기, 2:글 수정폼
				hitCount(no);
			}
			
			dbConn();
			sql="select no, subject, content, userid, writedate, hit from board where no=?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				vo.setNo(rs.getInt(1));
				vo.setSubject(rs.getString(2));
				vo.setContent(rs.getString(3));
				vo.setUserid(rs.getString(4));
				vo.setWritedate(rs.getString(5));
				vo.setHit(rs.getInt(6));
			}
			
		}catch(Exception e) {
			e.printStackTrace();
			
		}finally {
			dbClose();
		}
		return vo;
	}
	
	//글수정
	public int boardUpdate(BoardVO vo) {
		int result=0;
		try {
			dbConn();
			
			sql = "update board set subject=?, content=? where no=? and userid=?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, vo.getSubject());
			pstmt.setString(2,  vo.getContent());
			pstmt.setInt(3, vo.getNo());
			pstmt.setString(4, vo.getUserid());
			
			result = pstmt.executeUpdate();
			//수정 성공하면 resulut=1로 바뀜
			
		}catch(Exception e){
			e.printStackTrace();
			
		}finally {
			dbClose();
			
		} return result;
	}
	
	//글삭제
	public int boardDelete(int no, String userid) {
		int result = 0;
		try {
			dbConn();
			
			sql="delete from board where no=? and userid=?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			pstmt.setString(2, userid);
			
			result = pstmt.executeUpdate();
			//삭제 성공하면 1 (1개삭제함)
						
		}catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			dbClose();
		}
		return result;
	}
	
	//조회수증가
	public void hitCount(int no) {
		try {
			dbConn();
			
			sql = "update board set hit = hit+1 where no=?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			
			pstmt.executeUpdate();		
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			dbClose();
		}
	}
}
