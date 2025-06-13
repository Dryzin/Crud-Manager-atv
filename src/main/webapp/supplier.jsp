<jsp:directive.page contentType="text/html; charset=UTF-8" />
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <%@include file="base-head.jsp"%>
    <title>Lista de Fornecedores</title>
</head>
<body>

	<%@include file="modal.html"%>
	<%@include file="nav-menu.jsp"%>

<div class="container-fluid">
    <h1 class="mb-4">Fornecedores</h1>

    <c:if test="${not empty message}">
        <div class="alert ${alertType eq 1 ? 'alert-success' : 'alert-danger'} alert-dismissible" role="alert">
            <button type="button" class="close" data-dismiss="alert" aria-label="Fechar"><span aria-hidden="true">&times;</span></button>
            ${message}
        </div>
    </c:if>

    <div class="row" style="margin-bottom: 15px;">
        <div class="col-sm-8">
            <form class="form-inline" method="get" action="">
                <div class="form-group">
                    <input name="search" class="form-control" type="search" placeholder="Pesquisar fornecedores" aria-label="Search">
                </div>
                <button class="btn btn-danger" type="submit">Pesquisar</button>
            </form>
        </div>
        <div class="col-sm-4 text-right">
            <a href="${pageContext.request.contextPath}/supplier/form" class="btn btn-danger">
                <span class="glyphicon glyphicon-plus"></span> Adicionar Fornecedor
            </a>
        </div>
    </div>

    <div class="table-responsive">
        <table class="table table-striped table-hover">
            <thead class="bg-primary" style="color:white;">
                <tr>
                    <th>Nome</th>
                    <th>Email</th>
                    <th>Telefone</th>
                    <th>Endereço</th>
                    <th>Empresa</th>
                    <th>Ações</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="supp" items="${suppliers}">
                    <tr>
                        <td>${supp.getName()}</td>
                        <td>${supp.getEmail()}</td>
                        <td>${supp.getPhone()}</td>
                        <td>${supp.getAddress()}</td>
                        <td>${supp.getCompany().getName()}</td>
                        <td>
                            <a class="btn btn-sm btn-primary"
                               href="${pageContext.request.contextPath}/supplier/update?supplierId=${supp.getId()}">
                                <span class="glyphicon glyphicon-edit"></span>
                            </a>
                            <a class="btn btn-sm btn-danger modal-remove"
                               href="#" data-toggle="modal"
                               data-target="#deleteModal"
                               data-id="${supp.getId()}"
                               data-name="${supp.getName()}">
                               <span class="glyphicon glyphicon-trash"></span>
                            </a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
    
    	<div class="row">
	        <div class="col-md-12 text-center">
	            <ul class="pagination">
	                <li class="disabled"><a>&lt; Anterior</a></li>
	                <li class="active"><a>1</a></li>
	                <li><a href="#">2</a></li>
	                <li><a href="#">3</a></li>
	                <li class="next"><a href="#" rel="next">Próximo &gt;</a></li>
	            </ul>
	        </div>
	    </div>
</div>

<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="deleteModalLabel">
    <div class="modal-dialog" role="document">
        <form method="post" action="${pageContext.request.contextPath}/supplier/delete">
            <input type="hidden" name="supplierId" id="modalSupplierId">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Fechar">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title" id="deleteModalLabel">Confirmar Exclusão</h4>
                </div>
                <div class="modal-body">
                    Tem certeza que deseja excluir o fornecedor <strong id="modalSupplierName"></strong>?
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-danger">Excluir</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                </div>
            </div>
        </form>
    </div>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script>
    $('#deleteModal').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget);
        var supplierId = button.data('id');
        var supplierName = button.data('name');

        $('#modalSupplierId').val(supplierId);
        $('#modalSupplierName').text(supplierName);
    });
</script>
</body>
</html>
