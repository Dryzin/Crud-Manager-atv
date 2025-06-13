<jsp:directive.page contentType="text/html; charset=UTF-8" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="pt-br">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Login - CRUD Manager</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" />
    
    <style>
    	
    	.flex-grow-1.d-flex.justify-content-center.align-items-center{background:linear-gradient(135deg,#003a74,#585858)}.card{background:rgb(255 255 255 / 16%);border:none;border-radius:12px;backdrop-filter:blur(10px);box-shadow:0 0 30px rgba(0,0,0,.15)}.card h2{color:#fff;font-weight:700}label{color:#fff;font-weight:500}.form-control{background-color:rgba(255,255,255,.8);border:none;border-radius:6px;font-size:14px}.form-control:focus{box-shadow:none;outline:#c0392b solid 2px}.btn-dark{background-color:#e74c3c;border:none;transition:background-color .3s}.btn-dark:hover{background-color:#c0392b}.text-danger{color:#ffeaea!important}footer{background-color:rgba(0,0,0,.7)}footer p{margin:0;font-size:14px}
    
	    .hidden {
	      display: none;
	    }
  	</style>
  </head>
  <body>
    <div class="d-flex flex-column min-vh-100 bg-light">
      <nav class="navbar navbar-dark bg-dark">
        <div class="container">
          <span class="navbar-brand mb-0 h1">CRUD Manager</span>
        </div>
      </nav>

      <main class="flex-grow-1 d-flex justify-content-center align-items-center">
        <div class="card shadow-sm p-4" style="width: 100%; max-width: 400px;">
          
          <h2 class="text-center mb-4">Login</h2>
          
          <form action="${pageContext.request.contextPath}/login" method="POST">
            <div class="mb-3">
              <label for="user_login_id" class="form-label">Login (e-mail)</label>
              <input type="text" class="form-control" id="user_login_id" name="user_login" required />
            </div>
            
            <div class="mb-3">
              <label for="user_pw_id" class="form-label">Senha</label>
              <input type="password" class="form-control" id="user_pw_id" name="user_pw" required />
            </div>
            
            <div class="d-grid mb-3">
              <button type="submit" class="btn btn-dark btn-lg">Logar</button>
            </div>
            
            <c:if test="${param.erro == 'true'}">
			    <span class="text-danger small">Usuário ou senha inválidos.</span>
			</c:if>
          </form>
          
        </div>
      </main>

      <footer class="bg-dark text-white text-center py-3 mt-auto">
        <div class="container">
          <jsp:useBean id="date" class="java.util.Date" />
		  <fmt:formatDate value="${date}" pattern="yyyy" var="currentYear" />
          <p class="mb-0">©<c:out value="${currentYear}" />CRUD Manager. Todos os direitos reservados.</p>
        </div>
      </footer>
    </div>
  </body>
</html>