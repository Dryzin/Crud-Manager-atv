<jsp:directive.page contentType="text/html; charset=UTF-8" />
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="pt-br">
	<head>
		<%@include file="base-head.jsp"%>
	</head>
	<body>
		<%@include file="modal.html"%>
		<%@include file="nav-menu.jsp"%>
					
		<div class="container-fluid">
	    <h1 class="mb-4">Posts</h1>
	
	    <div id="alert" style="${not empty message ? 'display: block;' : 'display: none;'}" 
	         class="alert alert-dismissable ${alertType eq 1 ? 'alert-success' : 'alert-danger'}">
	        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
	        ${message}
	    </div>
	
	    <div class="row" style="margin-bottom: 15px;">
	        <div class="col-md-6">
	            <div class="input-group h2">
	                <input name="data[search]" class="form-control" id="search" type="text" placeholder="Pesquisar posts">
	                <span class="input-group-btn">
	                    <button class="btn btn-danger" type="submit">
	                        <span class="glyphicon glyphicon-search"></span>
	                    </button>
	                </span>
	            </div>
	        </div>
	
	        <div class="col-md-6 text-right">
	            <a href="${pageContext.request.contextPath}/post/form" class="btn btn-danger">
	                <span class="glyphicon glyphicon-plus"></span> Adicionar Post
	            </a>
	        </div>
	    </div>
	
	    <div class="table-responsive">
	        <table class="table table-striped table-hover">
	            <thead class="bg-primary" style="color: white;">
	                <tr>
	                    <th>Data</th>
	                    <th>Conteúdo</th>
	                    <th>Usuário</th>
	                    <th>Editar</th>
	                    <th>Excluir</th>
	                </tr>
	            </thead>
	            <tbody>
	                <c:forEach var="post" items="${posts}">
	                    <tr>
	                        <td>${post.getPostDate()}</td>
	                        <td>${post.getContent()}</td>
	                        <td>${post.getUser().getName()}</td>
	                        <td>
	                            <a class="btn btn-sm btn-primary"
	                               href="${pageContext.request.contextPath}/post/update?postId=${post.getId()}">
	                                <span class="glyphicon glyphicon-edit"></span>
	                            </a>
	                        </td>
	                        <td>
	                            <a class="btn btn-sm btn-danger modal-remove"
	                               href="#" data-toggle="modal"
	                               data-target="#delete-modal"
	                               post-id="${post.getId()}"
	                               post-content="${post.getContent()}">
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
		
		<script type="text/javascript" src="js/jquery.min.js"></script>
		<script type="text/javascript" src="js/bootstrap.min.js"></script>
		<script type="text/javascript">
			$(document).ready(function() {
			    // fecha o alert após 3 segundos
			    setTimeout(function() {
			        $("#alert").slideUp(500);
			    }, 3000);
			    
			    // ao clicar no delete de algum post, pega o nome do usuário, 
			    // o id do usuário e a ação (delete) e envia para o modal 
			    $(".modal-remove").click(function () {
		            var postContent = $(this).attr('post-content');
		            var postId = $(this).attr('post-id');
		            $(".modal-body #hiddenValue").text("o post '"+postContent+"'");
		            $("#id").attr( "value", postId);
		            $("#form").attr( "action","post/delete");
		        })
			});
		</script>
	</body>
</html>
