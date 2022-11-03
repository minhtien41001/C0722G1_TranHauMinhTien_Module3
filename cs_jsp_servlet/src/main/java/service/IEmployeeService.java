package service;

import model.Employee;

import java.util.List;

public interface IEmployeeService {
    List<Employee> findAll();

    boolean create(Employee employee);

    Employee findById(int idFind);

    boolean edit(Employee employee);

    boolean delete(int idDelete);

    List<Employee> search(String nameSearch, String addressSearch, String phoneSearch);
}
