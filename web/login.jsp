<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <title>Autentificacion de Usuarios</title>

        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <link rel="stylesheet" type="text/css" href="css/estilo_login.css">
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="css/all.css">


        <script type="text/javascript" th:src="@{/js/jquery-3.5.1.min.js}"></script>
        <script type="text/javascript" th:src="@{/js/bootstrap.bundle.min.js}"></script>

   </head>

    <script>
        function entrar() {
            document.form.action = "<%=request.getContextPath()%>/usuarioServlet";
            document.form.method = "POST";
            document.form.op.value = "1";
            document.form.submit();
        }
        function registrar() {
            document.form.action = "<%=request.getContextPath()%>/usuarioServlet";
            document.form.method = "POST";
            document.form.op.value = "2";
            document.form.submit();
        }
    </script>
 
<body class="dark-edition">
    <div class="container">
        
        
        <div class="row justify-content-center pt-5 mt-1 m-1">
            <div class="col-md-6 col-sm-8 col-xl-4 col-lg-5 formulario">    
                <form name="form">
                    <input type="hidden" name="op">
                    <div class="form-group text-center pt-4">	
                    <h2 class="text-light"><span class="linea">INICIAR SESSION</span></h2>
                    <img src="img/usuario.jpg">
                    </div>
                    <section class="form-login">
                        <div class="form-group mx-sm-4 pt-3">
                        <select class="form-control" name="rolusuario"  id="rolusuario" >
                            <option value="0" selected>Tipo de usuario</option> 
                            <option value="1">VIAJERO</option> 
                            <option value="2">GUIA</option> 
                        </select>
                        </div>
                        <div class="form-group mx-sm-4 pt-3">     
                        <input class="form-control" type="text" name="usuario" placeholder="Usuario" >
                        </div>
                        <div class="form-group mx-sm-4 pt-3"> 
                        <input class="form-control" type="password" name="password" placeholder="Contraseña">
                        </div>
                        <div class="form-group mx-sm-4 pb-2"> 
                        <input type="submit" class="btn btn-success btn-lg btn-block" onclick="entrar()" value="INICIAR SESION">
                        </div>
                    <!-- <p><a href="#">¿Olvidastes tu Contraseña?</a></p> -->
                       
                    <p><a onclick="registrar()" class="text-white bg-dark" > ¿Es nuevo aquí?</a> Haga su registro</p>
                    <%   if (request.getAttribute("mensaje") != null) {%>
                    <strong><br><p style="text-align: center;"><%=(String) request.getAttribute("mensaje")%></p></strong>
                    <%      }%>  
                </section>
                </form>
            </div>    
        </div>
    </div>
</body>
</html>