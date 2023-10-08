package main.java.reception.controller;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import main.java.common.ReceptionFileRenamePolicy;
import  main.java.common.model.vo.PageInfo;
import  main.java.member.model.vo.Member;
import main.java.reception.model.vo.Reception;
import main.java.reception.model.vo.ReceptionFile;
import main.java.reception.service.ReceptionService;

/**
 * Servlet implementation class UploadReceptionController
 * 
 * post 방식 -> 회원의 문의 접수 요청을 처리
 */
@WebServlet("/uploadReception")
public class UploadReceptionController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UploadReceptionController() {
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
		HttpSession session = request.getSession();
		
		if(ServletFileUpload.isMultipartContent(request)) {
			// 1-1. 전송용량제한
			int maxSize = 1024*1024*10;
			
			// 1-2. 저장할 폴더의 물리적인 경로
			String savePath = request.getServletContext().getRealPath("/assets/reception_file");
			
			// 2. 전달된 파일명 수정 작업 후 서버에 업로드
			MultipartRequest multi = new MultipartRequest(request, savePath, maxSize, "UTF-8", new ReceptionFileRenamePolicy());
			System.out.println(((Member)session.getAttribute("loginUser")).getUserId());
			// 3. DB에 전달할 값 추출
			Reception r = new Reception(((Member)session.getAttribute("loginUser")).getUserId(), multi.getParameter("recept-form-category")); // userId & category 생성자
			r.setTitle(multi.getParameter("recept-form-title"));
			r.setText(multi.getParameter("recept-form-content").replaceAll("\r\n", "<br>"));
			
			// 첨부파일 (1개만 가능)
			// recept-form-file
			ReceptionFile rfile = null;
			
			try { // multi에 파일이 있을 경우
				Enumeration files = multi.getFileNames();
		        String key =(String)files.nextElement();
		 
		        String orgName = multi.getOriginalFileName(key);
		        String newName = multi.getFilesystemName(key);
		        if(orgName!=null) {
		        	rfile = new ReceptionFile(orgName, newName, "assets/reception_file/");		        	
		        }
			}catch(Exception e) {
				
			}
			int result = new ReceptionService().submitReception(r, rfile);
			
			if(result>0) { // 성공
				request.getSession().setAttribute("msg", "회원님의 문의가 접수되었습니다.");
			}else { // 실패
				request.getSession().setAttribute("msg",  "문의를 접수하는 데에 실패했습니다. 다시 시도해주세요.");
			}
			response.sendRedirect(request.getContextPath()+"/myReception"); 
		}
	}

}
