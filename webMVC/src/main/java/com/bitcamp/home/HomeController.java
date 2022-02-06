package com.bitcamp.home;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/*.do")
public class HomeController extends HttpServlet {
   private static final long serialVersionUID = 1L;
   
   HashMap<String, CommandService> hm = new HashMap<String, CommandService>();

    public HomeController() {
        super();

    }
    
    public void init(ServletConfig config) throws ServletException{
    	//urlMapping.properties에 있는 key와 value를 구하여 HashMap에 주소와 객체....(뒷말못적음)
    	//web.xml에서 properties 파일명 가져오기
    	String propFileName = config.getInitParameter("path");
    	System.out.println("propFileName = "+propFileName); //properties 파일 경로 뜸
    	
    	Properties prop = new Properties();
    	try {
    		//파일에서 문자열을 읽어 properties 객체 저장한다.
    		FileInputStream fis = new FileInputStream(propFileName);
    		prop.load(fis);
    	}catch(Exception e) {
    		System.out.println("프로퍼티 객체 입력 에러 발생"+e.getMessage());
    	}
    	///////////////////////////////////////////////
    	
    	//properties 객체의 모든 키를 구한다
    	Enumeration keyList = prop.propertyNames();
    	while(keyList.hasMoreElements()) { //남은키가 있니? 있으면 T
    		String key = (String)keyList.nextElement(); //키리스트에 있는 키값 하나씩 갖고오기
    		String className = prop.getProperty(key); //그 키로 value값 갖고오기
    		
    		
    		//key : HashMap 키로 사용하고,
    		//value : 객체를 만들어 HashMap 값으로 사용한다.
    		try {
    			Class commandClass = Class.forName(className);
    			CommandService service = (CommandService) commandClass.getDeclaredConstructors()[0].newInstance();
    			hm.put(key, service);
    		}catch(Exception e) {
    			System.out.println("Command 객체 생성 에러 발생");
    		}
    		
    		System.out.println("key="+key+", "+className);
    		//urlMapping에 있는 내용이 뜸
    	}
    }

   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      doPost(request, response);
   }

   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      //System.out.println("컨트롤러가 실행됨.");
	  String ctxPath = request.getContextPath();
      String uri = request.getRequestURI();
      System.out.println("ctxPath = "+ctxPath); ///webMVC
      System.out.println("uri = "+uri); ///webMVC/*.do
      
      //mapping 주소 구하기
      String key = uri.substring(ctxPath.length()); // /*.do
      CommandService command = hm.get(key);
      String viewFileName = command.execute(request, response); //커맨드에서 리턴받아온 jsp파일
      
      //view파일명의 위치로 이동하기
      RequestDispatcher dispatcher = request.getRequestDispatcher(viewFileName);
      dispatcher.forward(request, response);
      
   }

}