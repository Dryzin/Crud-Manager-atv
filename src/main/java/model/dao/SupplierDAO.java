package model.dao;

import java.util.List;

import model.Supplier;
import model.ModelException;

public interface SupplierDAO {
    boolean save(Supplier supplier) throws ModelException;
    boolean update(Supplier supplier) throws ModelException;
    boolean delete(int id) throws ModelException;
    List<Supplier> listAll() throws ModelException;
    Supplier findById(int id) throws ModelException;
}