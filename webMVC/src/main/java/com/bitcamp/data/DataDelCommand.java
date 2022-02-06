package com.bitcamp.data;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bitcamp.home.CommandService;

public class DataDelCommand implements CommandService {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {


		int num = Integer.parseInt(request.getParameter("num"));
		
		//삭제할 레코드의 파일명을 선택하라
		DataDAO dao = new DataDAO();
		String dbFile = dao.getDbFile(num);
		
		HttpSession session = request.getSession();
		String userid = (String)session.getAttribute("userid");
		
		//레코드 지우기
		int cnt = dao.dataDelete(num, userid);
		
		if(cnt>0) {//삭제 -> 파일삭제
			String path = request.getServletContext().getRealPath("/upload");
			File f = new File(path, dbFile);
			f.delete();
		}
		
		request.setAttribute("cnt", cnt);
		request.setAttribute("num", num);
		return "delOk.jsp";
	}

}
