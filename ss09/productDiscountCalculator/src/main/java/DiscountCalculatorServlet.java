import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.math.BigDecimal;

@WebServlet(name = "DiscountCalculatorServlet", value = "/discount")
public class DiscountCalculatorServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String description =request.getParameter("description");
        double price = Double.parseDouble(request.getParameter("price"));
        BigDecimal bigPrice = new BigDecimal(price);
        double discount = Double.parseDouble(request.getParameter("discount"));
        BigDecimal discountAmount =new BigDecimal(price * discount * 0.01) ;
        BigDecimal discountPrice =bigPrice.subtract(discountAmount);
        String priceInvalid = "price invalid";
        String discountInvalid = "discount invalid";

        if (price < 0){
            request.setAttribute("error",priceInvalid);
            request.getRequestDispatcher("/error.jsp").forward(request,response);
        }else  if (discount > 100 || discount < 0){
            request.setAttribute("error",discountInvalid);
            request.getRequestDispatcher("error.jsp").forward(request,response);
        }else {
            request.setAttribute("description",description);
            request.setAttribute("price",price);
            request.setAttribute("discount",discount);
            request.setAttribute("discountAmount",discountAmount);
            request.setAttribute("discountPrice",discountPrice);
            request.getRequestDispatcher("result.jsp").forward(request,response);
        }
    }
}
