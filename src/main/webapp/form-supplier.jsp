<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Formulário de Fornecedor</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-5">
    <h1 class="mb-4">
        <c:choose>
            <c:when test="${action eq 'insert'}">Novo Fornecedor</c:when>
            <c:when test="${action eq 'update'}">Editar Fornecedor</c:when>
        </c:choose>
    </h1>

    <form action="${pageContext.request.contextPath}/supplier/${action}" method="post" class="row g-3">
        <c:if test="${action eq 'update'}">
            <input type="hidden" name="supplierId" value="${supplier.supplierId}" />
        </c:if>

        <div class="col-md-6">
            <label for="name" class="form-label">Nome</label>
            <input type="text" class="form-control" name="name" id="name" value="${supplier.name}" required>
        </div>

        <div class="col-md-6">
            <label for="email" class="form-label">Email</label>
            <input type="email" class="form-control" name="email" id="email" value="${supplier.email}" required>
        </div>

        <div class="col-md-6">
            <label for="phone" class="form-label">Telefone</label>
            <input type="text" class="form-control" name="phone" id="phone" value="${supplier.phone}" required>
        </div>

        <div class="col-md-6">
            <label for="address" class="form-label">Endereço</label>
            <input type="text" class="form-control" name="address" id="address" value="${supplier.address}" required>
        </div>

		<div class="col-md-6">
		    <label for="company" class="form-label">Empresa</label>
		    <select class="form-select" name="company" id="company" required>
		        <option value="">Selecione...</option>
		        
		        <c:forEach items="${companies}" var="company">
		            <option value="${company.id}" 
		                <c:if test="${supplier.company != null && supplier.company.id == company.id}">selected</c:if>>
		                ${company.name}
		            </option>
		        </c:forEach>
		        
		    </select>
		</div>
            
        

        <div class="col-12 mt-4">
            <button type="submit" class="btn btn-success">Salvar</button>
            <a href="${pageContext.request.contextPath}/supplier" class="btn btn-secondary">Cancelar</a>
        </div>
        </div>
    </form>
</div>
</body>
</html>
