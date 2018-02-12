package net.petriv.warehouse.controller;

import net.petriv.warehouse.dao.ManufacturerDao;
import net.petriv.warehouse.dao.ProductDao;
import net.petriv.warehouse.model.Manufacturer;
import net.petriv.warehouse.model.Product;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.List;

public class ProductServlet extends HttpServlet {

    private ProductDao productDao;
    private ManufacturerDao manufacturerDao;

    public ProductServlet() {
        productDao = new ProductDao();
        manufacturerDao = new ManufacturerDao();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/jsp");
        String forward = "";
        String action = request.getParameter("action");

        if (action.equalsIgnoreCase("list")) {
            forward = "WEB-INF/listProducts.jsp";
            request.setAttribute("products", productDao.getAll());

        } else if (action.equalsIgnoreCase("insert")) {
            forward = "WEB-INF/productForm.jsp";

        } else if (action.equalsIgnoreCase("delete")) {
            Long id = Long.parseLong(request.getParameter("productId"));
            productDao.delete(id);
            forward = "WEB-INF/listProducts.jsp";
            request.setAttribute("products", productDao.getAll());

        } else if (action.equalsIgnoreCase("edit")) {
            Long id = Long.parseLong(request.getParameter("productId"));
            Product product = productDao.getById(id);
            request.setAttribute("products", product);
            forward = "WEB-INF/productForm.jsp";
        }

        RequestDispatcher view = request.getRequestDispatcher(forward);
        view.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {

        Product product = new Product();
        product.setName(request.getParameter("name"));
        product.setPrice(new BigDecimal(request.getParameter("price").replaceAll(",", "")));

        Long manufId = Long.parseLong(request.getParameter("manufacturerId"));
        String prodId = request.getParameter("productId");
        Manufacturer manufacturer = manufacturerDao.getById(manufId);
        product.setManufacturer(manufacturer);

        if (prodId == null || prodId.isEmpty()) {
            productDao.save(product);
        } else {
            productDao.update(product);
            }

        List<Product> list = productDao.getAll();
        request.setAttribute("products", list);

        String forward = "WEB-INF/listProducts.jsp";
        RequestDispatcher view = request.getRequestDispatcher(forward);
        view.forward(request, response);

    }
}

