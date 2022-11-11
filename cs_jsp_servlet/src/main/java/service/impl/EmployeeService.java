package service.impl;

import model.Employee;
import repository.IEmployeeRepository;
import repository.impl.EmployeeRepository;
import service.IEmployeeService;

import java.util.List;

public class EmployeeService implements IEmployeeService {
    private IEmployeeRepository iEmployeeRepository = new EmployeeRepository();
    @Override
    public List<Employee> findAll() {
        return iEmployeeRepository.findAll();
    }

    @Override
    public boolean create(Employee employee) {
        return iEmployeeRepository.create(employee);
    }

    @Override
    public Employee findById(int idFind) {
        return iEmployeeRepository.findById(idFind);
    }

    @Override
    public boolean edit(Employee employee) {
        return iEmployeeRepository.edit(employee);
    }

    @Override
    public boolean delete(int idDelete) {
        return iEmployeeRepository.delete(idDelete);
    }

    @Override
    public List<Employee> search(String nameSearch, String addressSearch, String phoneSearch) {
        return iEmployeeRepository.search(nameSearch,addressSearch,phoneSearch);
    }
}
