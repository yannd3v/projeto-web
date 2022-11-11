<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
	
	<title>Curso JSP</title>
	
<style type="text/css">

form{
 position: absolute;
 top: 40%;
 left: 35%;
 right:35%;
}

h1{
 position: absolute;
 top: 30%;
 left: 36%;
}

.msg{
 position: absolute;
 top: 70%;
 left: 35%;
 font-size: 15px;
 color: #664d03;
 background-color: #fff3cd;
 border-color: #ffecb5;
}

</style>
</head>
<body>

<h1>Bem vindo ao curso de JSP</h1>  


<form action="<%= request.getContextPath() %>/ServletLogin" method="post" class="row g-3 needs-validation" novalidate>
<input type="hidden" value="<%= request.getParameter("url") %>" name="url">
  
  <div class="mb-3">
  	<label class="form-label" for="login">Login</label> 
  	<input class="form-control" id="login" name="login" type="text" required="required">
  	<div class="invalid-feedback">
      Obrigatório
    </div>
      	<div class="valid-feedback">
      Ok!
    </div>
  </div>
  
  <div class="mb-3">
  	<label class="form-label">Senha</label> 
  	<input class="form-control" name="senha" type="password" required="required">
  	<div class="invalid-feedback">
      Obrigatório
    </div>
  	<div class="valid-feedback">
      Ok!
    </div>
  </div>
 
  	<input type="submit" value="Acessar" class="btn btn-primary">


</form>

<h5 class="msg">${msg}</h5>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>

<script type="text/javascript">

(() => {
	  'use strict'

	  // Fetch all the forms we want to apply custom Bootstrap validation styles to
	  const forms = document.querySelectorAll('.needs-validation')

	  // Loop over them and prevent submission
	  Array.from(forms).forEach(form => {
	    form.addEventListener('submit', event => {
	      if (!form.checkValidity()) {
	        event.preventDefault()
	        event.stopPropagation()
	      }

	      form.classList.add('was-validated')
	    }, false)
	  })
	})()
	
</script>

</body>
</html>