package main.java.reception.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonObject;

import main.java.reception.model.vo.Reception;
import main.java.reception.service.ReceptionService;

/**
 * Servlet implementation class ReplyReceptionController
 * 
 * 관리자의 회원문의글에 대한 답변등록 요청 처리
 */
@WebServlet("/replyReception")
public class ReplyReceptionController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReplyReceptionController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json; charset=UTF-8");
		String no = request.getParameter("no");
		String text = request.getParameter("text").replaceAll("\r\n", "<br>");
		String resData;
		
		Reception reply = new Reception();
		reply.setReceptionNo(no);
		reply.setReply(text);
		
		try{
			int result = new ReceptionService().insertReceptionReply(reply);
		
			if(result>0) {
				resData = "해당 문의에 대한 답변을 등록하였습니다.";
			}else {
				resData = "등록에 실패했습니다. 다시 시도해주세요.";
				
			}
		} catch (Exception e) {
	        resData = "등록에 실패했습니다. 다시 시도해주세요.";
	        e.printStackTrace(); // Handle or log the exception appropriately
	    }
		
		JsonObject jsonObject = new JsonObject();
	    jsonObject.addProperty("message", resData);
	    
	    // Write the JSON response to the response body
	    response.getWriter().print(jsonObject.toString());
//		response.getWriter().print(resData);
	}

}
