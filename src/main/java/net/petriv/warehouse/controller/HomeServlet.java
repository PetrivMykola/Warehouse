package net.petriv.warehouse.controller;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class HomeServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/jsp");
        String forward = "WEB-INF/index.jsp";
        RequestDispatcher view = request.getRequestDispatcher(forward);
        view.forward(request, response);
    }
}
