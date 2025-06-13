package model;

import java.util.Date;

public class Supplier {
    private int id;
    private String name;
    private String email;
    private String phone;
    private String address;
    private Company company;
    private Date createdAt;

    public Supplier() {}
    
    public Supplier(int id) {
        this.id = id;
    }

    // Getters e setters
    
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getPhone() { return phone; }
    public void setPhone(String phone) { this.phone = phone; }

    public String getAddress() { return address; }
    public void setAddress(String address) { this.address = address; }

    public Company getCompany() { return company; }
    
    public void setCompany(Integer companyId) {
        this.company = new Company(companyId);
    }

    public void setCompany(Company company) {
        this.company = company;
    }

    public Date getCreatedAt() { return createdAt; }
    public void setCreatedAt(Date createdAt) { this.createdAt = createdAt; }
}
