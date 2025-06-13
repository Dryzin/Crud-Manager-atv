# Crud-Manager-atv

# 📦 Adição de Módulo de Fornecedores (Supplier) ao Projeto Java JSP MVC

Este projeto teve como principal objetivo **adicionar a funcionalidade de gerenciamento de fornecedores** (`Supplier`) a um sistema web já existente. A implementação foi feita utilizando o padrão **MVC**, com **Java, JSP, Servlets, JSTL, Bootstrap e JDBC** para acesso ao banco de dados MySQL.

---

## 🗃️ Estrutura do Banco de Dados

Foi necessário criar uma nova tabela `supplier`, vinculada à tabela `company` (empresa) através de uma **chave estrangeira**.

### Script SQL:

```sql
CREATE TABLE company (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE supplier (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(20),
    address VARCHAR(150),
    company_id INT,
    FOREIGN KEY (company_id) REFERENCES company(id)
);

```

```
🧩 Estrutura do Módulo Supplier (MVC)
A implementação do módulo seguiu a arquitetura padrão MVC, com as seguintes camadas:

src/
├── model/
│   ├── Supplier.java
│   ├── Company.java
│   ├── dao/
│   │   ├── SupplierDAO.java
│   │   └── MySQLSupplierDAO.java
│   └── DBHandler.java
│
├── controller/
│   └── SupplierController.java
│
WebContent/
├── form-supplier.jsp
├── supplier.jsp
├── base-head.jsp
├── nav-menu.jsp
├── modal.html
```
## 🧠 Lógica e Funcionamento do Módulo Supplier

### 🔹 `Supplier.java`
Classe modelo que representa o fornecedor, com os seguintes atributos:
- `name`: nome do fornecedor
- `email`: e-mail de contato
- `phone`: telefone
- `address`: endereço
- `company`: referência à entidade `Company` (empresa associada)

### 🔹 `Company.java`
Classe auxiliar que representa as empresas cadastradas. Utilizada para associar um fornecedor a uma empresa via chave estrangeira.

### 🔹 `SupplierDAO.java` (Interface)
Define os métodos de persistência para a entidade `Supplier`:
- `save(Supplier s)` – Cadastra novo fornecedor
- `update(Supplier s)` – Atualiza um fornecedor existente
- `delete(int id)` – Remove um fornecedor pelo ID
- `findById(int id)` – Busca um fornecedor específico
- `findAll()` – Retorna todos os fornecedores

### 🔹 `MySQLSupplierDAO.java`
Implementação concreta da interface `SupplierDAO`, utilizando JDBC para executar comandos SQL e interagir com o banco de dados MySQL.

### 🔹 `DBHandler.java`
Classe utilitária responsável por estabelecer a conexão com o banco de dados. Centraliza dados como URL, usuário e senha, facilitando manutenção e reaproveitamento.

---

## 🎮 Controller

### 🔹 `SupplierController.java`
Servlet responsável por lidar com as requisições enviadas para `/supplier/*`. Gerencia o fluxo de dados entre a view e o modelo. As ações tratadas incluem:

- `form`: carrega o formulário de cadastro ou edição de fornecedor
- `save`: salva ou atualiza um fornecedor com base nos dados do formulário
- `update`: carrega os dados de um fornecedor para edição
- `delete`: exclui um fornecedor do banco de dados
- `list`: exibe a lista de todos os fornecedores cadastrados

---

## 📄 Views (JSP)

### 🔹 `form-supplier.jsp`
Página de formulário que permite cadastrar ou editar um fornecedor. Possui campos como nome, e-mail, telefone, endereço e um `<select>` que lista todas as empresas disponíveis para vínculo.

### 🔹 `supplier.jsp`
Página de visualização dos fornecedores cadastrados. Permite:
- Listar todos os fornecedores
- Pesquisar por nome ou e-mail
- Editar ou remover um fornecedor através de botões de ação
- Confirmar a exclusão por meio de um modal

---
