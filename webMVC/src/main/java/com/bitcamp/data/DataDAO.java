package com.bitcamp.data;


import java.util.ArrayList;
import java.util.List;

import com.bitcamp.home.DBConnection;

public class DataDAO extends DBConnection {
	
	//게시글 업로드
	public int dataInsert(DataVO vo) {
		int result=0;
		try {
			dbConn();
			
			sql="insert into data(num, title, content, filename, userid) values(boardsq.nextval, ?,?,?,?)";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getContent());
			pstmt.setString(3, vo.getFilename());
			pstmt.setString(4, vo.getUserid());
			
			result = pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			dbClose();
		}
		return result;
	}
	
	//레코드 전체 선택(자료실 리스트)
	public List<DataVO> dataSelect() {
		List<DataVO> list = new ArrayList<DataVO>();
		
		try {
			dbConn();
			sql="select num,title,userid,filename,hit,to_char(writedate,'MM-DD HH:MI') writedate "
					+" from data order by num desc";
			
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				DataVO vo = new DataVO();
				
				vo.setNum(rs.getInt(1));
				vo.setTitle(rs.getString(2));
				vo.setUserid(rs.getString(3));
				vo.setFilename(rs.getString(4));
				vo.setHit(rs.getInt(5));
				vo.setWritedate(rs.getString(6));
				
				list.add(vo);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
			
		}finally {
			dbClose();
		}
		
		return list;
	}
	
	//다운로드 횟수 증가
	public int downCount(int num) {
		int cnt = 0;
		try {
			dbConn();
			
			sql = "update data set downcount=downcount+1 where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			pstmt.executeUpdate();
			
			//사용끝났으니까 덮어쓰기
			sql="select downcount from data where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				cnt = rs.getInt(1);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			dbClose();
		}
		return cnt;
	}
	
	//레코드 선택 (게시글 제목 누르면 게시글 내용 보여짐)
	public DataVO oneSelect(int num) {
		DataVO vo = new DataVO();
		try {
			dbConn();
			sql="select num, userid, title, content, hit, downcount, writedate, filename "
					+" from data where num=?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				vo.setNum(rs.getInt(1));
				vo.setUserid(rs.getString(2));
				vo.setTitle(rs.getString(3));
				vo.setContent(rs.getString(4));
				vo.setHit(rs.getInt(5));
				vo.setDowncount(rs.getInt(6));
				vo.setWritedate(rs.getString(7));
				vo.setFilename(rs.getString(8));
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		
		}finally {
			dbClose();
		}
		return vo;
	}
	
	//조회수 증가
	public void hitCount(int num) {
		try {
			dbConn();
			sql = "update data set hit=hit+1 where num="+num;
			//좋은 방법은 아니지만 그냥 해보기
			
			pstmt= con.prepareStatement(sql);
			pstmt.executeUpdate();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			dbClose();
		}
	}
	
	//자료실 글 수정
	public int dataUpdate(DataVO vo) {
		int result = 0;
		
		try {
			dbConn();
			sql = "update data set title=?, content=? "; //일단 제목,내용은 무조건 업데이트
			
			if(vo.getFilename()!=null && !vo.getFilename().equals("")) { //첨부파일 있으면 쿼리문 추가
				sql += " , filename=? ";
			}
			sql += " where num=?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getContent());
			
			if(vo.getFilename()!=null && !vo.getFilename().equals("")) {
				//첨부파일 있으면 쿼리문 ? 순서 달라서 if문 써야함
				pstmt.setString(3, vo.getFilename());
				pstmt.setInt(4, vo.getNum());
			}
			else {
				pstmt.setInt(3, vo.getNum());
			}
			
			result = pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			dbClose();
		}
		return result;
	}
	
	//파일명 선택
	public String getDbFile(int num) {
		String dbFile = null;
		try {
			dbConn();
			sql = "select filename from data where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dbFile = rs.getString(1); 
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			dbClose();
		}
		return dbFile;
	}
	
	//레코드 삭제
	public int dataDelete(int num, String userid) {
		int result=0;
		
		try {
			dbConn();
			sql="delete data where num=? and userid=?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, userid);
			
			result = pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
			
		}finally {
			dbClose();
		}
		return result;
	}
	

}
