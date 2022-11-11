package repository.impl;

import model.Employee;
import repository.BaseRepository;
import repository.IEmployeeRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EmployeeRepository implements IEmployeeRepository {
    private static final String FIND_ALL = "select * from employee where is_delete = 0;";
    private static final String INSERT = "insert into employee(name, date_of_birth,id_card, " +
            "salary, phone_number, email, address, position_id, education_degree_id, " +
            "division_id) values(?,?,?,?,?,?,?,?,?,?)";
    private static final String FIND_BY_ID = "select * from employee where id = ? and is_delete = 0;";
    private static final String UPDATE = "update employee set name = ?, date_of_birth = ?, " +
            "id_card = ?, salary = ?, phone_number = ?, email = ?, " +
            "address = ?, position_id = ?, education_degree_id = ?, division_id = ? where id = ? and " +
            "is_delete = 0;";
    private static final String DELETE = "update employee set is_delete = 1 where id = ? and is_delete = 0;";
    private static final String SEARCH = "select * from employee where is_delete = 0 and name like ? and " +
            "address like ? and phone_number like ?;";

    @Override
    public List<Employee> findAll() {
        List<Employee> employeeList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();

        try {
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_ALL);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                int employeeId = resultSet.getInt("id");
                String employeeName = resultSet.getString("name");
                String employeeBirthday = resultSet.getString("date_of_birth");
                String employeeIdCard = resultSet.getString("id_card");
                double employeeSalary = resultSet.getInt("salary");
                String employeePhone = resultSet.getString("phone_number");
                String employeeEmail = resultSet.getString("email");
                String employeeAddress = resultSet.getString("address");
                int positionId = resultSet.getInt("position_id");
                int educationDegreeId = resultSet.getInt("education_degree_id");
                int divisionId = resultSet.getInt("division_id");

                Employee employee = new Employee(employeeId, employeeName, employeeBirthday, employeeIdCard,
                        employeeSalary, employeePhone, employeeEmail, employeeAddress, positionId, educationDegreeId,
                        divisionId);
                employeeList.add(employee);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return employeeList;

    }

    @Override
    public boolean create(Employee employee) {
        Connection connection = BaseRepository.getConnectDB();

        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT);

            preparedStatement.setString(1,employee.getEmployeeName());
            preparedStatement.setString(2,employee.getEmployeeBirthday());
            preparedStatement.setString(3,employee.getEmployeeIdCard());
            preparedStatement.setDouble(4,employee.getEmployeeSalary());
            preparedStatement.setString(5, employee.getEmployeePhone());
            preparedStatement.setString(6, employee.getEmployeeEmail());
            preparedStatement.setString(7, employee.getEmployeeAddress());
            preparedStatement.setInt(8, employee.getPositionId());
            preparedStatement.setInt(9, employee.getEducationDegreeId());
            preparedStatement.setInt(10, employee.getDivisionId());

            int num = preparedStatement.executeUpdate();
            return (num == 1);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public Employee findById(int idFind) {
        Employee employee = null;
        Connection connection = BaseRepository.getConnectDB();

        try {
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_BY_ID);
            preparedStatement.setInt(1,idFind);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                int employeeId = resultSet.getInt("id");
                String employeeName = resultSet.getString("name");
                String employeeBirthday = resultSet.getString("date_of_birth");
                String employeeIdCard = resultSet.getString("id_card");
                double employeeSalary = resultSet.getInt("salary");
                String employeePhone = resultSet.getString("phone_number");
                String employeeEmail = resultSet.getString("email");
                String employeeAddress = resultSet.getString("address");
                int positionId = resultSet.getInt("position_id");
                int educationDegreeId = resultSet.getInt("education_degree_id");
                int divisionId = resultSet.getInt("division_id");

                 employee = new Employee(employeeId, employeeName, employeeBirthday, employeeIdCard,
                        employeeSalary, employeePhone, employeeEmail, employeeAddress, positionId, educationDegreeId,
                        divisionId);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return employee;
    }

    @Override
    public boolean edit(Employee employee) {
        boolean rowUpdate = false;
        Connection connection = BaseRepository.getConnectDB();

        try {
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE);

            preparedStatement.setString(1,employee.getEmployeeName());
            preparedStatement.setString(2,employee.getEmployeeBirthday());
            preparedStatement.setString(3,employee.getEmployeeIdCard());
            preparedStatement.setDouble(4,employee.getEmployeeSalary());
            preparedStatement.setString(5, employee.getEmployeePhone());
            preparedStatement.setString(6, employee.getEmployeeEmail());
            preparedStatement.setString(7, employee.getEmployeeAddress());
            preparedStatement.setInt(8, employee.getPositionId());
            preparedStatement.setInt(9, employee.getEducationDegreeId());
            preparedStatement.setInt(10, employee.getDivisionId());
            preparedStatement.setInt(11,employee.getEmployeeId());

            rowUpdate = preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rowUpdate;
    }

    @Override
    public boolean delete(int idDelete) {
        boolean rowDelete = false;
        Connection connection = BaseRepository.getConnectDB();

        try {
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE);
            preparedStatement.setInt(1, idDelete);
            rowDelete = preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rowDelete;
    }

    @Override
    public List<Employee> search(String nameSearch, String addressSearch, String phoneSearch) {
        List<Employee> employeeList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();

        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SEARCH);
            preparedStatement.setString(1,"%" + nameSearch + "%");
            preparedStatement.setString(2,"%" + addressSearch + "%");
            preparedStatement.setString(3,"%" + phoneSearch + "%");
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                int employeeId = resultSet.getInt("id");
                String employeeName = resultSet.getString("name");
                String employeeBirthday = resultSet.getString("date_of_birth");
                String employeeIdCard = resultSet.getString("id_card");
                double employeeSalary = resultSet.getInt("salary");
                String employeePhone = resultSet.getString("phone_number");
                String employeeEmail = resultSet.getString("email");
                String employeeAddress = resultSet.getString("address");
                int positionId = resultSet.getInt("position_id");
                int educationDegreeId = resultSet.getInt("education_degree_id");
                int divisionId = resultSet.getInt("division_id");

                Employee employee = new Employee(employeeId, employeeName, employeeBirthday, employeeIdCard,
                        employeeSalary, employeePhone, employeeEmail, employeeAddress, positionId, educationDegreeId,
                        divisionId);
                employeeList.add(employee);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return employeeList;
    }
}
