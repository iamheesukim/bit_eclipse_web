package com.bitcamp.data;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bitcamp.home.CommandService;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class DataEditOkCommand implements CommandService {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String path = request.getServletContext().getRealPath("/upload");//파일 업로드 위치
		int maxSize = 1024*1024*1024;
		
		DefaultFileRenamePolicy pol = new DefaultFileRenamePolicy();
		MultipartRequest mr = new MultipartRequest(request, path, maxSize, "UTF-8", pol);
		
		//업로드 완료
		DataVO vo = new DataVO();
		vo.setNum(Integer.parseInt(mr.getParameter("num")));
		vo.setTitle(mr.getParameter("title"));
		vo.setContent(mr.getParameter("content"));
		vo.setDelfile(mr.getParameter("delfile"));
		
		String newFilename = mr.getFilesystemName("filename");
		
		vo.setFilename(newFilename); //새로 추가된 업로드 파일
		
		// DB 업데이트 ---------------------------------------
		DataDAO dao = new DataDAO();
		int result = dao.dataUpdate(vo);
		
		//파일 정리
		if(result>0) { //레코드 수정됨
			//삭제된 파일 지우기
			if(vo.getDelfile()!=null && !vo.getDelfile().equals("")) {
				File f = new File(path, vo.getDelfile());
				f.delete();
				
			}
			
		}else {//레코드 수정못함
			//새로 업로드된 파일이 있으면 
			if(vo.getDelfile()!=null && !vo.getDelfile().equals("")) {
				File f = new File(path, vo.getDelfile());
				f.delete();
			}
		}
		
		request.setAttribute("num", vo.getNum());
		request.setAttribute("result", result);
		
		return "dataEditResult.jsp";
	}

}
