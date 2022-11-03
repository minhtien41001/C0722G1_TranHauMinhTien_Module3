import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "CalculatorServlet", value = "/calculator")
public class CalculatorServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        float operandFirst = Float.parseFloat(request.getParameter("operandFirst"));
        String operator = request.getParameter("operator");
        float operandSecond = Float.parseFloat(request.getParameter("operandSecond"));
        try{
            float result = calculate(operandFirst, operandSecond, operator);
            request.setAttribute("result", result);
            request.getRequestDispatcher("/result.jsp").forward(request, response);
        } catch (RuntimeException e){
            request.setAttribute("result", e.getMessage());
            request.getRequestDispatcher("/result.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
    private float calculate(float firstOperand, float secondOperand, String operator ){
        switch (operator){
            case "+":
                return firstOperand + secondOperand;
            case "-":
                return firstOperand - secondOperand;
            case "*":
                return firstOperand * secondOperand;
            case "/":
                if(secondOperand != 0)
                    return firstOperand / secondOperand;
                else
                    throw new RuntimeException("Can't divide by zero");
            default:
                throw new RuntimeException("Invalid operation");
        }
    }
}
