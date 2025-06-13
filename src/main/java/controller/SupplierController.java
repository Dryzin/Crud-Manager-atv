package controller;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Supplier;

import model.Company;
import model.dao.CompanyDAO;

import model.ModelException;
import model.dao.DAOFactory;
import model.dao.SupplierDAO;

@WebServlet(urlPatterns = {"/supplier", "/supplier/form", 
    "/supplier/insert", "/supplier/delete", "/supplier/update"})
public class SupplierController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String action = req.getRequestURI();

        switch (action) {
            case "/crud-manager/supplier/form": {
                CommonsController.listUsers(req);
                listCompanies(req);
                req.setAttribute("action", "insert");
                ControllerUtil.forward(req, resp, "/form-supplier.jsp");
                break;
            }
            case "/crud-manager/supplier/update": {
                String idStr = req.getParameter("supplierId");
                int supplierId = Integer.parseInt(idStr);

                SupplierDAO dao = DAOFactory.createDAO(SupplierDAO.class);
                Supplier supplier = null;

                try {
                    supplier = dao.findById(supplierId);
                } catch (ModelException e) {
                    e.printStackTrace();
                }

                CommonsController.listUsers(req);
                listCompanies(req);
                req.setAttribute("action", "update");
                req.setAttribute("supplier", supplier);
                ControllerUtil.forward(req, resp, "/form-supplier.jsp");
                break;
            }
            default: {
                listSuppliers(req);
                listCompanies(req);
                ControllerUtil.transferSessionMessagesToRequest(req);
                ControllerUtil.forward(req, resp, "/supplier.jsp");
            }
        }
    }

    private void listSuppliers(HttpServletRequest req) {
        SupplierDAO dao = DAOFactory.createDAO(SupplierDAO.class);

        try {
            List<Supplier> suppliers = dao.listAll();
            req.setAttribute("suppliers", suppliers);
        } catch (ModelException e) {
            e.printStackTrace(); // log no servidor
        }
    }
    
    public static void listCompanies(HttpServletRequest req) {
        CompanyDAO dao = DAOFactory.createDAO(CompanyDAO.class);
        try {
            List<Company> companies = dao.listAll();
            req.setAttribute("companies", companies);
        } catch (ModelException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String action = req.getRequestURI();

        switch (action) {
            case "/crud-manager/supplier/insert": {
                insertSupplier(req, resp);
                break;
            }
            case "/crud-manager/supplier/delete": {
                deleteSupplier(req, resp);
                break;
            }
            case "/crud-manager/supplier/update": {
                updateSupplier(req, resp);
                break;
            }
            default:
                System.out.println("URL inválida: " + action);
        }

        ControllerUtil.redirect(resp, req.getContextPath() + "/supplier");
    }

    private void insertSupplier(HttpServletRequest req, HttpServletResponse resp) {
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String phone = req.getParameter("phone");
        String address = req.getParameter("address");
        Integer companyId = Integer.parseInt(req.getParameter("company"));

        Supplier supplier = new Supplier();
        supplier.setName(name);
        supplier.setEmail(email);
        supplier.setPhone(phone);
        supplier.setAddress(address);
        supplier.setCompany(companyId);

        SupplierDAO dao = DAOFactory.createDAO(SupplierDAO.class);

        try {
            if (dao.save(supplier)) {
                ControllerUtil.sucessMessage(req, "Fornecedor '" + name + "' inserido com sucesso.");
            } else {
                ControllerUtil.errorMessage(req, "Fornecedor '" + name + "' não pôde ser inserido.");
            }
        } catch (ModelException e) {
            ControllerUtil.errorMessage(req, "Erro ao inserir fornecedor: " + e.getMessage());
        }
    }

    private void updateSupplier(HttpServletRequest req, HttpServletResponse resp) {
        String supplierIdStr = req.getParameter("supplierId");
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String phone = req.getParameter("phone");
        String address = req.getParameter("address");
        Integer companyId = Integer.parseInt(req.getParameter("company"));

        Supplier supplier = new Supplier(Integer.parseInt(supplierIdStr));
        supplier.setName(name);
        supplier.setEmail(email);
        supplier.setPhone(phone);
        supplier.setAddress(address);
        supplier.setCompany(companyId);

        SupplierDAO dao = DAOFactory.createDAO(SupplierDAO.class);

        try {
            if (dao.update(supplier)) {
                ControllerUtil.sucessMessage(req, "Fornecedor '" + name + "' atualizado com sucesso.");
            } else {
                ControllerUtil.errorMessage(req, "Fornecedor '" + name + "' não pôde ser atualizado.");
            }
        } catch (ModelException e) {
            ControllerUtil.errorMessage(req, "Erro ao atualizar fornecedor: " + e.getMessage());
        }
    }


    private void deleteSupplier(HttpServletRequest req, HttpServletResponse resp) {
        String supplierIdStr = req.getParameter("supplierId");
        int supplierId = Integer.parseInt(supplierIdStr);

        SupplierDAO dao = DAOFactory.createDAO(SupplierDAO.class);

        try {
            if (dao.delete(supplierId)) {
                ControllerUtil.sucessMessage(req, "Fornecedor removido com sucesso.");
            } else {
                ControllerUtil.errorMessage(req, "Fornecedor não pôde ser removido.");
            }
        } catch (ModelException e) {
            ControllerUtil.errorMessage(req, "Erro ao remover fornecedor: " + e.getMessage());
        }
    }
}