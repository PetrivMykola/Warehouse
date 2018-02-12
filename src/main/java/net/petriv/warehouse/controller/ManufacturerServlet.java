package net.petriv.warehouse.controller;

import net.petriv.warehouse.dao.ManufacturerDao;
import net.petriv.warehouse.model.Manufacturer;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContextListener;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class ManufacturerServlet extends HttpServlet {

    private ManufacturerDao dao;

    public ManufacturerServlet() {
        dao = new ManufacturerDao();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/jsp");
        String forward = "";
        String action = request.getParameter("action");

        if (action.equalsIgnoreCase("list")) {
            forward = "WEB-INF/listManufacturer.jsp";
            request.setAttribute("manufacturers", dao.getAll());

        } else if (action.equalsIgnoreCase("delete")) {
            Long id = Long.parseLong(request.getParameter("manufacturerId"));
            dao.delete(id);
            forward = "WEB-INF/listManufacturer.jsp";
            request.setAttribute("manufacturers", dao.getAll());

        } else if (action.equalsIgnoreCase("listProducts")) {
            Long id = Long.parseLong(request.getParameter("manufacturerId"));
            Manufacturer manufacturer = dao.getById(id);
            request.setAttribute("products", manufacturer.getProducts());
            forward = "WEB-INF/listProductsForManufacturer.jsp";

        } else if (action.equalsIgnoreCase("manufacturerInfo")) {
            Long id = Long.parseLong(request.getParameter("manufacturerId"));
            Manufacturer manufacturer = dao.getById(id);
            request.setAttribute("manufacturers", manufacturer);
            forward = "WEB-INF/manufacturerInfo.jsp";

        } else if (action.equalsIgnoreCase("insert")) {
            forward = "WEB-INF/manufacturerForm.jsp";

        } else if (action.equalsIgnoreCase("edit")) {
            Long id = Long.parseLong(request.getParameter("manufacturerId"));
            Manufacturer manufacturer = dao.getById(id);
            request.setAttribute("manufacturer", manufacturer);
            forward = "WEB-INF/manufacturerForm.jsp";
        }

        RequestDispatcher view = request.getRequestDispatcher(forward);
        view.forward(request, response);


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Manufacturer manufacturer = new Manufacturer();
        manufacturer.setName(request.getParameter("name"));
        String id = request.getParameter("manufacturerId");

        if (id == null || id.isEmpty()) {
            dao.save(manufacturer);
        } else {
            dao.update(manufacturer);
            }

        RequestDispatcher view = request.getRequestDispatcher("WEB-INF/listManufacturer.jsp");
        request.setAttribute("manufacturers", dao.getAll());
        view.forward(request, response);

    }
}
