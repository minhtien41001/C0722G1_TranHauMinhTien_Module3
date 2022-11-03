package servlet;

import model.Customer;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CustomerServlet", value = "/customer")
public class CustomerServlet extends HttpServlet {
    private static List<Customer> customerList = new ArrayList<>();
    static {
        customerList.add(new Customer("Martin Odegaard","1998-12-17","Nauy","https://resources.premierleague.com/premierleague/photo/2022/09/07/3800ee2b-e682-4288-9384-22ebea9f06fd/Martin-Odegaard-Arsenal.jpg"));
        customerList.add(new Customer("Granit Xhaka","1992-27-09","Thụy Sĩ","https://static.bongda24h.vn/medias/standard/2022/08/15/6_1508160742.jpg"));
        customerList.add(new Customer("Ben White","1997-10-08","Anh","https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTWGfqlKclUCwDNXNRMjveno252Ama2d5IfuQ&usqp=CAU"));
        customerList.add(new Customer("Bukayo Saka","2001-05-09","Anh","https://www.arsenal.com/sites/default/files/styles/large_16x9/public/images/Saka_42.jpg?itok=X0Okptsl"));
        customerList.add(new Customer("Gabriel Martinelli","2001-06-18","Brasil","https://i.guim.co.uk/img/media/e791576c5b8d333eb4405d982f52e69a49bac29a/83_194_4153_2492/master/4153.jpg?width=1200&height=1200&quality=85&auto=format&fit=crop&s=d89f591f06ff07a8b8ad9422f79fc377"));
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("customerList",customerList);
        request.getRequestDispatcher("/customer/customer.jsp").forward(request,response);
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
