package main.java.product.controller;

import main.java.product.model.service.ProductService;
import main.java.product.model.vo.Product;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;

import java.io.IOException;

@WebServlet("/payment.product")
public class ProductPaymentController extends HttpServlet
{

    private static final long serialVersionUID = 1L;

    public ProductPaymentController()
    {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        int productNo = Integer.parseInt(request.getParameter("pno"));
        ProductService pService = new ProductService();
        Product selectedProduct = pService.selectProduct(productNo);
        request.setAttribute("selectedProduct", selectedProduct);

        String selectedPerson = request.getParameter("person");
        session.setAttribute("selectedPerson", selectedPerson);
        String selectedOption = request.getParameter("option");
        session.setAttribute("selectedOption", selectedOption);
        String selectedDate = request.getParameter("date");
        session.setAttribute("selectedDate", selectedDate);
        String selectedImg = request.getParameter("img");
        session.setAttribute("selectedImg", selectedImg);



        request.getRequestDispatcher("views/product/ProductPaymentView.jsp").forward(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
    }
}