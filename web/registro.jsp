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
        function registrar() {
            document.form.action = "<%=request.getContextPath()%>/usuarioServlet";
            document.form.method = "GET";
            document.form.op.value = "3";
            document.form.submit();
        }

    </script>
    
<body class="dark-edition">
        
    <div class="container">
        <div class="row justify-content-center pt-5 mt-1 m-1">
            <div class="col-md-6 col-sm-8 col-xl-4 col-lg-5 formulario">
                <form name="form">
                    <input type="hidden"  name="op"> 
                    <section class="form-login">
                        
                        <div class="form-group text-center pt-4">
                            <img src="img/principal/avatar.png">
                            <h2 class="text-light"><span class="linea">Registrar nuevo Trek Entre Patas</span></h2>
                        </div>
                    
                        <div class="form-group mx-sm-4 pt-3">
                            <input class="form-control" type="text" name="nombres" id="nombres" placeholder="Nombre Completo">
                            <br>
                            <input class="form-control" type="text" name="apellidos" id="apellidos" placeholder="Apellido Completo">
                            <br>
                            <input class="form-control" type="text" name="dni" id="dni" placeholder="DNI">
                            <br>
                            <input class="form-control" type="number" name="numerovacunas" step="1" placeholder="Numero vacunas">
                            <br>
                            <input class="form-control" type="date" name="fecha_nac"  placeholder="ingrese fecha">
                            <br>
                            <input class="form-control" name="celular" type="text" placeholder="Celular">
                            <br>
                            <input class="form-control" name="correo" type="text" placeholder="Correo ">
                            <br>
                            <input class="form-control" type="text" name="usuario"  placeholder="Usuario">
                            <br>
                            <input class="form-control" type="password" name="contraseña" placeholder="Contraseña">
                            <br>
                            <input class="btn btn-success btn-lg btn-block" type="submit" onclick="registrar()" value="Registrar">
                        </div>  

                        <p>¿Ya tienes una cuenta?<a class="link" href="login.jsp"> Iniciar sesión</a></p>
                    </section>
                </form>
            </div>
        </div>
    </div>

      

    </body>
</html>
