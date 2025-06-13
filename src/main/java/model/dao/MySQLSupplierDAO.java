package model.dao;

import java.util.ArrayList;
import java.util.List;

import model.Company;
import model.ModelException;
import model.Supplier;

public class MySQLSupplierDAO implements SupplierDAO {

    @Override
    public boolean save(Supplier supplier) throws ModelException {
        DBHandler db = new DBHandler();

        String sql = "INSERT INTO supplier (name, email, phone, address, company_id) VALUES (?, ?, ?, ?, ?);";
        db.prepareStatement(sql);

        db.setString(1, supplier.getName());
        db.setString(2, supplier.getEmail());
        db.setString(3, supplier.getPhone());
        db.setString(4, supplier.getAddress());
        db.setInt(5, supplier.getCompany().getId());

        return db.executeUpdate() > 0;
    }

    @Override
    public boolean update(Supplier supplier) throws ModelException {
        DBHandler db = new DBHandler();

        String sql = "UPDATE supplier SET name = ?, email = ?, phone = ?, address = ?, company_id = ? WHERE id = ?;";
        db.prepareStatement(sql);

        db.setString(1, supplier.getName());
        db.setString(2, supplier.getEmail());
        db.setString(3, supplier.getPhone());
        db.setString(4, supplier.getAddress());
        db.setInt(5, supplier.getCompany().getId());
        db.setInt(6, supplier.getId());

        return db.executeUpdate() > 0;
    }

    @Override
    public boolean delete(int id) throws ModelException {
        DBHandler db = new DBHandler();

        String sql = "DELETE FROM supplier WHERE id = ?;";
        db.prepareStatement(sql);
        db.setInt(1, id);

        return db.executeUpdate() > 0;
    }

    @Override
    public List<Supplier> listAll() throws ModelException {
        DBHandler db = new DBHandler();

        String sql = "SELECT s.*, c.name AS company_name FROM supplier s INNER JOIN companies c ON s.company_id = c.id;";
        db.createStatement();
        db.executeQuery(sql);

        List<Supplier> list = new ArrayList<>();

        while (db.next()) {
            Company company = new Company(db.getInt("company_id"));
            company.setName(db.getString("company_name"));

            Supplier supplier = new Supplier(db.getInt("id"));
            supplier.setName(db.getString("name"));
            supplier.setEmail(db.getString("email"));
            supplier.setPhone(db.getString("phone"));
            supplier.setAddress(db.getString("address"));
            supplier.setCompany(company);
            supplier.setCreatedAt(db.getDate("created_at"));

            list.add(supplier);
        }

        return list;
    }

    @Override
    public Supplier findById(int id) throws ModelException {
        DBHandler db = new DBHandler();

        String sql = "SELECT * FROM supplier WHERE id = ?;";
        db.prepareStatement(sql);
        db.setInt(1, id);
        db.executeQuery();

        Supplier s = null;

        while (db.next()) {
            s = new Supplier(id);
            s.setName(db.getString("name"));
            s.setEmail(db.getString("email"));
            s.setPhone(db.getString("phone"));
            s.setAddress(db.getString("address"));
            s.setCreatedAt(db.getDate("created_at"));

            CompanyDAO companyDAO = DAOFactory.createDAO(CompanyDAO.class);
            Company company = companyDAO.findById(db.getInt("company_id"));
            s.setCompany(company);

            break;
        }

        return s;
    }
}
