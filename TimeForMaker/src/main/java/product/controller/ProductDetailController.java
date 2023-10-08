package main.java.product.controller;

import main.java.product.model.service.ProductService;
import main.java.product.model.vo.File;
import main.java.product.model.vo.Product;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/detail.product")
public class ProductDetailController extends HttpServlet
{

    private static final long serialVersionUID = 1L;

    public ProductDetailController()
    {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        int productNo = Integer.parseInt(request.getParameter("pno"));
        ProductService pService = new ProductService();
        Product p = pService.selectProduct(productNo);
        ArrayList<File> fi = pService.selectFile(productNo);
        // 조회수 증가 / 게시글 정보 조회(Product) / 첨부파일 조회 (File)

        int result = pService.increaseCount(productNo);
        // result가 0보다 크면 유효한 게시글 작으면 유효하지 않은 게시글
        if(result > 0){ // 게시글 정보, 첨부파일 정보 조회해오기
            


            request.setAttribute("p",p);
            request.setAttribute("fi",fi); // 파일 리스트를 request에 저장

            request.getRequestDispatcher("views/product/ProductDetailView.jsp").forward(request,response);

        } else{
            request.setAttribute("errorMsg","상품 조회 실패");
            request.getRequestDispatcher("views/common/errorPage.jsp").forward(request,response);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        doGet(request, response);
    }
}