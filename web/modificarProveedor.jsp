<%@page import="Modelo.Proveedor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>
<%!
    Proveedor objproveedor;
%>
<%
    objproveedor = (Proveedor) request.getAttribute("datos");
%>
<!DOCTYPE html>
<html>
     <head>
<meta charset="UTF-8">
<title>AGREGAR PROVEDOR</title>

<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
      
<link rel="stylesheet" type="text/css" media="all" href="css/paginaprincipal.css">
<link rel="stylesheet" type="text/css" href="css/estilo_login.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/all.css">

</head>
    <script>
        function modificarProveedor(idproveedor) {
            document.form.action = "<%=request.getContextPath()%>/proveedorServlet";
            document.form.method = "POST";
            document.form.op.value = "5";
            document.form.idproveedor.value = idproveedor;
            document.form.submit();
            window.alert("¡PROVEEDOR MODIFICADO!");
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
                    <h2 class="text-light"><span class="linea">MODIFICAR provedor </span></h2>
                    </div> 
            
            
            
        <form name="form">
            <input type="hidden"  name="op"> 
            <input type="hidden"  name="idproveedor">
            <section class="form-login">
                
                
                <div>
                    <div class="form-group mx-sm-4 pt-1">
                    <label class="text-center">CODIGO</label> 
                    <input class="form-control" type="text" disabled="false" value="<%=objproveedor.getIdproveedor()%>" >
                    </div>
                    
                    
                    <div class="form-group mx-sm-4 pt-1">
                    <label class="text-center">RUC</label> 
                    <input class="form-control" type="text" name="ruc" value="<%=objproveedor.getRuc()%>" >
                    </div>
                    
                    <div class="form-group mx-sm-4 pt-1">
                    <label class="text-center">Razon Social</label> 
                    <input class="form-control" type="text" name="razon_social" value="<%=objproveedor.getRazon_social()%>" >
                   </div>
                    
                    
                    <div class="form-group mx-sm-4 pt-1">
                    <label class="text-center">Correo</label> 
                    <input class="form-control" type="email" name="correo" value="<%=objproveedor.getCorreo()%>" >
                    </div>
                    
                    <div class="form-group mx-sm-4 pt-1">
                    <label class="text-center">Celular</label> 
                    <input class="form-control" type="text" name="telefono" value="<%=objproveedor.getTelefono()%>" >
                    </div>

                    <div class="form-group mx-sm-4 pt-1">
                    <label class="text-center">Costo</label> 
                    <input class="form-control" type="number" step="0.10" name="costo" value="<%=objproveedor.getCosto() %>" >
                    </div>
                    
                    <div class="form-group mx-sm-4 pt-1">
                    <input class="btn btn-success btn-lg btn-block" type="submit" onclick="modificarProveedor('<%=objproveedor.getIdproveedor()%>')" value="modificar">
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
