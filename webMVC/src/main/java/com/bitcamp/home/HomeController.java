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
    	//urlMapping.properties�� �ִ� key�� value�� ���Ͽ� HashMap�� �ּҿ� ��ü....(�޸�������)
    	//web.xml���� properties ���ϸ� ��������
    	String propFileName = config.getInitParameter("path");
    	System.out.println("propFileName = "+propFileName); //properties ���� ��� ��
    	
    	Properties prop = new Properties();
    	try {
    		//���Ͽ��� ���ڿ��� �о� properties ��ü �����Ѵ�.
    		FileInputStream fis = new FileInputStream(propFileName);
    		prop.load(fis);
    	}catch(Exception e) {
    		System.out.println("������Ƽ ��ü �Է� ���� �߻�"+e.getMessage());
    	}
    	///////////////////////////////////////////////
    	
    	//properties ��ü�� ��� Ű�� ���Ѵ�
    	Enumeration keyList = prop.propertyNames();
    	while(keyList.hasMoreElements()) { //����Ű�� �ִ�? ������ T
    		String key = (String)keyList.nextElement(); //Ű����Ʈ�� �ִ� Ű�� �ϳ��� �������
    		String className = prop.getProperty(key); //�� Ű�� value�� �������
    		
    		
    		//key : HashMap Ű�� ����ϰ�,
    		//value : ��ü�� ����� HashMap ������ ����Ѵ�.
    		try {
    			Class commandClass = Class.forName(className);
    			CommandService service = (CommandService) commandClass.getDeclaredConstructors()[0].newInstance();
    			hm.put(key, service);
    		}catch(Exception e) {
    			System.out.println("Command ��ü ���� ���� �߻�");
    		}
    		
    		System.out.println("key="+key+", "+className);
    		//urlMapping�� �ִ� ������ ��
    	}
    }

   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      doPost(request, response);
   }

   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      //System.out.println("��Ʈ�ѷ��� �����.");
	  String ctxPath = request.getContextPath();
      String uri = request.getRequestURI();
      System.out.println("ctxPath = "+ctxPath); ///webMVC
      System.out.println("uri = "+uri); ///webMVC/*.do
      
      //mapping �ּ� ���ϱ�
      String key = uri.substring(ctxPath.length()); // /*.do
      CommandService command = hm.get(key);
      String viewFileName = command.execute(request, response); //Ŀ�ǵ忡�� ���Ϲ޾ƿ� jsp����
      
      //view���ϸ��� ��ġ�� �̵��ϱ�
      RequestDispatcher dispatcher = request.getRequestDispatcher(viewFileName);
      dispatcher.forward(request, response);
      
   }

}