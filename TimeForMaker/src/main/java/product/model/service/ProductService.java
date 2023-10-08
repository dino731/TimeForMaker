package main.java.product.model.service;
import main.java.product.model.dao.ProductDao;
import main.java.product.model.vo.File;
import main.java.product.model.vo.Product;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import static main.java.common.JDBCTemplate.*;

public class ProductService
{

    public int increaseCount(int productNo) {

        Connection conn = getConnection();

        int result = new ProductDao().increaseCount(conn, productNo);
        

        // 성공하면 커밋 아니면 롤백
        if(result > 0 ) {
            commit(conn);
        }else{
            rollback(conn);
        }

        close(conn);
        return result;
    }

    public Product selectProduct(int productNo) {
        Connection conn = getConnection();

        Product p = new ProductDao().selectProduct(conn,productNo);

        close(conn);

        return p;
    }

    public ArrayList<File> selectFile(int productNo) {
        Connection conn = getConnection();
        ArrayList<File> fiList = new ProductDao().selectFile(conn, productNo);
        close(conn);
        return fiList;
    }

    public List<Product> getAllProducts() {
        Connection conn = getConnection();
        List<Product> pList = new ProductDao().getAllProducts(conn);


        close(conn);
        return pList;
    }


    public List<File> getAllFiles() {
        Connection conn = getConnection();
        List<File> fList = new ProductDao().getAllFiles(conn);
        close(conn);
        return fList;
    }



}







