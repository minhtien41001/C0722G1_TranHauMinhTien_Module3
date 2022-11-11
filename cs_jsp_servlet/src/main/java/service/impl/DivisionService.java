package service.impl;

import model.Division;
import repository.IDivisionRepository;
import repository.impl.DivisionRepository;
import service.IDivisionService;

import java.util.List;

public class DivisionService implements IDivisionService {
    private IDivisionRepository iDivisionRepository = new DivisionRepository();
    @Override
    public List<Division> findAll() {
        return iDivisionRepository.findAll();
    }
}
