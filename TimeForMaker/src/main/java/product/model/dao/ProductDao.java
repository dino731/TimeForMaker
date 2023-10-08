package main.java.product.model.dao;

import main.java.product.model.vo.File;
import main.java.product.model.vo.Product;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import static main.java.common.JDBCTemplate.*;

public class ProductDao
{

    private Properties prop = new Properties();

    public ProductDao()
    {
        try
        {
            prop.loadFromXML(new FileInputStream(ProductDao.class.getResource("/sql/product/product-mapper.xml").getPath()));
        }
        catch (IOException e)
        {
            e.printStackTrace();
        }

    }

    public int increaseCount(Connection conn, int productNo)
    {
        int result = 0;
        PreparedStatement pstmt = null;
        String sql = prop.getProperty("increaseCount");

        try
        {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, productNo);

            result = pstmt.executeUpdate();
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }
        finally
        {
            close(pstmt);
        }
        return result;

    }


    public Product selectProduct(Connection conn, int productNo)
    {

        Product p = null;
        PreparedStatement pstmt = null;
        ResultSet rset = null;

        String sql = prop.getProperty("selectProduct");

        try
        {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, productNo);

            rset = pstmt.executeQuery();

            if (rset.next())
            {
                p = new Product(
                        rset.getString("PRODUCT_NO"),
                        rset.getString("CLASS_NAME"),
                        rset.getInt("PRICE"),
                        rset.getString("LOCATION"),
                        rset.getInt("MAX_PERSON"),
                        rset.getString("DELETE_CHECK"),
                        rset.getInt("VIEWS"),
                        rset.getDouble("RATING"),
                        rset.getString("NOTICE"),
                        rset.getInt("NOW_PERSON"),
                        rset.getString("CLASS_INTRO"),
                        rset.getString("CLASS_PROGRESS"),
                        rset.getString("CLASS_KEYWORD"),
                        rset.getString("CLASS_CATEGORY"),
                        rset.getString("CLASS_OPTION")
                );
            }
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        } finally
        {
            close(rset);
            close(pstmt);
        }
        return p;
    }

    public ArrayList<File> selectFile(Connection conn, int productNo) {
        ArrayList<File> fiList = new ArrayList<>();
        PreparedStatement pstmt = null;
        ResultSet rset = null;
        String sql = prop.getProperty("selectFile");

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, productNo);

            rset = pstmt.executeQuery();

            while (rset.next()) {
                File fi = new File();


                fi.setRefNo(rset.getString(1));
                fi.setFileName(rset.getString(2));
                fi.setFileSavePath(rset.getString(3));
                fi.setFileLevel(rset.getInt(4));

                fiList.add(fi);

//                System.out.println("DAO출력 @@@@@ File Save Path : "+fi.getFileSavePath());
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(rset);
            close(pstmt);
            close(conn);
        }
        return fiList;
    }



    public List<Product> getAllProducts(Connection conn) {
        List<Product> pList = new ArrayList<>();
        PreparedStatement pstmt = null;
        ResultSet rset = null;
        String sql = prop.getProperty("getAllProducts");

        try {
            pstmt = conn.prepareStatement(sql);
            rset = pstmt.executeQuery();

            while (rset.next()) {
                Product p = new Product();
                p.setProductNo(rset.getString("PRODUCT_NO"));
                p.setClassName(rset.getString("CLASS_NAME"));
                p.setPrice(rset.getInt("PRICE"));
                p.setLocation(rset.getString("LOCATION"));
                p.setMaxPerson(rset.getInt("MAX_PERSON"));
                p.setDeleteCheck(rset.getString("DELETE_CHECK"));
                p.setViews(rset.getInt("VIEWS"));
                p.setRating(rset.getDouble("RATING"));
                p.setNotice(rset.getString("NOTICE"));
                p.setNowPerson(rset.getInt("NOW_PERSON"));
                p.setClassIntro(rset.getString("CLASS_INTRO"));
                p.setClassProgress(rset.getString("CLASS_PROGRESS"));
                p.setClassKeyword(rset.getString("CLASS_KEYWORD"));
                p.setClassCategory(rset.getString("CLASS_CATEGORY"));
                p.setClassOption(rset.getString("CLASS_OPTION"));
                pList.add(p);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rset != null) {
                    rset.close();
                }
                if (pstmt != null) {
                    pstmt.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
            // 연결 닫기
            close(conn);
        }

        return pList;
    }

    public List<File> getAllFiles(Connection conn) {
        List<File> fList = new ArrayList<>();
        PreparedStatement pstmt = null;
        ResultSet rset = null;
        String sql = prop.getProperty("getAllFiles");

        try {
            pstmt = conn.prepareStatement(sql);
            rset = pstmt.executeQuery();

            while (rset.next()) {
                File f = new File();
                f.setRefNo(rset.getString("REF_NO"));
                f.setFileName(rset.getString("FILE_NAME"));
                f.setFileSavePath(rset.getString("FILE_SAVE_PATH"));
                f.setFileLevel(rset.getInt("FILE_LEVEL"));
                fList.add(f);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rset != null) {
                    rset.close();
                }
                if (pstmt != null) {
                    pstmt.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
            // 연결 닫기
            close(conn);
        }

        return fList;
    }





}







