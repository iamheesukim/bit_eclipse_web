package com.bitcamp.data;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bitcamp.home.CommandService;

public class DownCountCommand implements CommandService {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		//���ڵ� ��ȣ ���ϱ�
		int num = Integer.parseInt(request.getParameter("num"));
		
		DataDAO dao = new DataDAO();
		int cnt = dao.downCount(num); //������� �ٿ�ε�Ƚ�� ���Ϲ���
						
		request.setAttribute("cnt", cnt);
		return "downCountResult.jsp";
	}

}
