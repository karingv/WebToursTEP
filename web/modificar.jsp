<%@page import="Modelo.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>
<%!
    Usuario objusuario;
%>
<%
    objusuario = (Usuario) request.getAttribute("datos");
%>
<!DOCTYPE html>
<html>
 <head>
<meta charset="UTF-8">
<title>AGREGAR USUARIO</title>

<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
      
<link rel="stylesheet" type="text/css" media="all" href="css/paginaprincipal.css">
<link rel="stylesheet" type="text/css" href="css/estilo_login.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/all.css">

</head>
    <script>
        function modificar(idcliente) {
            document.form.action = "<%=request.getContextPath()%>/usuarioServlet";
            document.form.method = "GET";
            document.form.op.value = "6";
            document.form.idcliente.value = idcliente;
            document.form.submit();
            window.alert("¡USUARIO MODIFICADO!");
        }
        function regresarindexAdmin() {
            document.form.action = "<%=request.getContextPath()%>/mantenimientoServlet";
            document.form.method = "POST";
            document.form.op.value = "7";
            document.form.submit();
        }
        function verReservas() {
            document.form.action = "<%=request.getContextPath()%>/mantenimientoServlet";
            document.form.method = "POST";
            document.form.op.value = "4";
            document.form.submit();
        }
        function verDestinos() {
            document.form.action = "<%=request.getContextPath()%>/mantenimientoServlet";
            document.form.method = "POST";
            document.form.op.value = "5";
            document.form.submit();
        }
        function verProveedor() {
            document.form.action = "<%=request.getContextPath()%>/mantenimientoServlet";
            document.form.method = "POST";
            document.form.op.value = "6";
            document.form.submit();
        }
        function salir() {
            document.form.action = "<%=request.getContextPath()%>/usuarioServlet";
            document.form.method = "POST";
            document.form.op.value = "8";
            document.form.submit();
        }

    </script>



<body class="dark-edition">
    
    <div class="container"">
        
        
          <div class="row justify-content-center pt-1 m-0">
                <div class="col-md-6 col-sm-8 col-xl-4 col-lg-5 formulario">
                    
                    <div class="form-group text-center pt-1">	
                    <img src="img/principal/avatar.png">
                    <h2 class="text-light"><span class="linea">MODIFICAR USUARIO</span></h2>
                    </div> 

        <form name="form">
            <input type="hidden"  name="op"> 
            <input type="hidden"  name="idcliente">
            <input type="hidden" name="rol" value="<%=objusuario.getId_rol()%>">
            <section class="form-login">
               
                <div>
                    <div class="form-group mx-sm-4 pt-1">
                        <label class="text-center">CODIGO</label>  
                    <input class="form-control" type="text" disabled="false" value="<%=objusuario.getIdcliente()%>" >
                    </div>
                    <div class="form-group mx-sm-4 pt-1">
                          <label>Nombre</label>  
                    <input class="form-control" type="text" name="nombres" value="<%=objusuario.getNombres()%>" >
                    </div>
                        
                    <div class="form-group mx-sm-4 pt-1">
                        <label>Apellido</label>  
                    <input class="form-control" type="text" name="apellidos" value="<%=objusuario.getApellidos()%>" >
                    </div>
                        
                    <div class="form-group mx-sm-4 pt-1">
                        <label>DNI</label>  
                    <input class="form-control" type="text" name="dni" value="<%=objusuario.getDni()%>" >
                    </div>
                        
                    <div class="form-group mx-sm-4 pt-1">
                        <label>Numero de Vacunas</label>  
                    <input class="form-control" type="number" name="numerovacunas" value="<%=objusuario.getNumerovacunas()%>" >
                    </div>
                        
                    <div class="form-group mx-sm-4 pt-1">
                        <label>Fecha de nacimiento</label>  
                    <input class="form-control" type="date" name="fecha_nac" value="<%=objusuario.getFecha_nac()%>" >
                    </div>
                        
                    <div class="form-group mx-sm-4 pt-1">
                        <label>Celular</label>  
                    <input class="form-control" type="text" name="celular" value="<%=objusuario.getCelular()%>">
                    </div>
                        
                    <div class="form-group mx-sm-4 pt-1">
                        <label>Correo</label>  
                    <input class="form-control" type="email" name="correo" value="<%=objusuario.getCorreo()%>">
                    </div>
                        
                    <div class="form-group mx-sm-4 pt-1">
                        <label>Usuario</label>  
                    <input class="form-control" type="text" name="usuario" value="<%=objusuario.getUsuario()%>" >
                    </div>
                         
                    <div class="form-group mx-sm-4 pt-1">
                        <label>Contraseña</label> 
                    <input class="form-control" type="password" name="contraseña" value="<%=objusuario.getContraseña()%>" >
                    </div>
                    <div class="form-group mx-sm-4 pt-1">
                    <input class="btn btn-success btn-lg btn-block" type="submit" onclick="modificar('<%=objusuario.getIdcliente()%>')" value="modificar">
                    </div> 
                </div>
            </section>
        </form>
                </div>
          </div>
    </div>
                    
                    
                                                                    <!--Scripts-->
        <script src="https://kit.fontawesome.com/1a98240850.js" crossorigin="anonymous"></script>  
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
        <!-- JAVASCRIPTS -->
        <script src="js/jquery.min.js"></script>
        <script src="js/jquery.backtotop.js"></script>
        <script src="js/jquery.mobilemenu.js"></script>
        
    </body>
</html>
