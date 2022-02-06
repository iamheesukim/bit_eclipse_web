package com.bitcamp.data;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bitcamp.home.CommandService;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class WriteOkCommand implements CommandService {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 파일이 업로드 되는 위치의 절대주소를 구하낟.
		String path = request.getServletContext().getRealPath("/upload");
		System.out.println("path = "+path);
		
		//파일 업로드와 폼의 데이터를 서버로 가져가는 클래스
		// 1.request 2.파일업로드위치
		// 3.업로드가능한파일의최대크기(byte) 1024*1024*1024
		// 4.한글인코딩
		// 5.파일명이 중복될 때 파일명을 Rename 해주는 클래스를 객체로 만들어준다.
		int maxSize = 1024*1024*1024;
		DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();
		MultipartRequest mr = new MultipartRequest(request, path, maxSize, "UTF-8", policy);
		
		DataVO vo = new DataVO();
		vo.setTitle(mr.getParameter("title"));
		vo.setContent(mr.getParameter("content"));
		System.out.println("title ==> "+vo.getTitle());
		System.out.println("content ==> "+vo.getContent());
		
		HttpSession ses = request.getSession();
		vo.setUserid((String)ses.getAttribute("userid"));
		
		//파일명처리
		//1.폼의 name 정보를 얻어오기
		Enumeration fileList = mr.getFileNames(); //filename
		
		while(fileList.hasMoreElements()) {
			String fileAttr = (String)fileList.nextElement();
			//변경된 파일 이름 가져오기
			String newFilename = mr.getFilesystemName(fileAttr);
			System.out.println("파일명 ==> "+newFilename);
			vo.setFilename(newFilename);
				
		}
		
		//데이터베이스 레코드 추가
		DataDAO dao = new DataDAO();
		int result = dao.dataInsert(vo);
		
		if(result<=0) {//글이 등록되지 않았을 때
			//파일 삭제 후 글쓰기(history)
								//경로	파일명
			File file = new File(path, vo.getFilename());
			file.delete();
		}
		
		//					변수명		값
		request.setAttribute("cnt", result);
		//이러면서 dataWriteOk.jsp 에서 cnt라는 변수명으로 result를 쓸 수 있음
				
		return "dataWriteOk.jsp";
	}

}
