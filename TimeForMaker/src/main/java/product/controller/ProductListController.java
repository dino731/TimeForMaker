package main.java.product.controller;

import main.java.product.model.service.ProductService;
import main.java.product.model.vo.File;
import main.java.product.model.vo.Product;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;

import java.io.IOException;
import java.util.List;

@WebServlet("/productList")
public class ProductListController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public ProductListController() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // ProductService를 생성합니다.
        ProductService pService = new ProductService();

        // ProductService를 사용하여 모든 상품 데이터를 가져옵니다.
        List<Product> pList = pService.getAllProducts();
        List<File> fList = pService.getAllFiles();


        // productList.jsp 파일에 상품 데이터를 전달합니다.
        request.setAttribute("productList", pList);
        request.setAttribute("fileList", fList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("views/product/productList.jsp");
        dispatcher.forward(request, response);


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}