<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
<%@page import="Modelo.*" %>
<!DOCTYPE html>
<%!
    Reserva objreserva;
    Destino objdestino;
    Usuario objusuario;

%>
<%

    objreserva = (Reserva) request.getAttribute("datos");
    objdestino = (Destino) request.getAttribute("destino");
    objusuario = (Usuario) request.getAttribute("usuario");

%>
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

        function reservarDestino() {
            document.form.action = "<%=request.getContextPath()%>/reservaServlet";
            document.form.method = "GET";
            document.form.op.value = "2";
            document.form.submit();
            window.alert("RESERVA PENDIENTE DE PAGO - MOSTRAR COMPROBANTE DE PAGO EN EL SIGUIENTE LINK https://wa.link/o23pxs ");
        }
        function historial() {
            document.form.action = "<%=request.getContextPath()%>/usuarioServlet";
            document.form.method = "POST";
            document.form.op.value = "7";
            document.form.submit();
        }
        function salir() {
            document.form.action = "<%=request.getContextPath()%>/usuarioServlet";
            document.form.method = "POST";
            document.form.op.value = "8";
            document.form.submit();
        }
        function regresarPaginaPrincipal() {
            document.form.action = "<%=request.getContextPath()%>/usuarioServlet";
            document.form.method = "POST";
            document.form.op.value = "9";
            document.form.submit();
        }


    </script>
        <body class="dark-edition">
   
        
<div class="container"">
        
        
    <div class="row justify-content-center pt-1 m-0">
        <div class="col-md-6 col-sm-8 col-xl-4 col-lg-5 formulario">
                    
                    <div class="form-group text-center pt-1">	
                    <img src="img/principal/avatar.png">
                    <h2 class="text-light"><span class="linea">RESERVAR DESTINO </span></h2>
                    </div> 
            
     

        <form name="form" action="post" id="">
            <input type="hidden" name="op">
            <input class="form-control" type="hidden" name="idcliente" value="<%=objreserva.getIdcliente()%>">
            <input class="form-control" type="hidden" name="iddestino" value="<%=objreserva.getIddestino()%>">

         

            <h5>Cliente: &nbsp;<input class="form-control" type="text" name="" value="<%=objusuario.getNombres()%> <%=objusuario.getApellidos()%>""></h5>                      
            <h5>Destino: &nbsp;<input class="form-control" type="text" name="" value="<%=objdestino.getDestino()%>"></h5>
            <h5>Departamento: &nbsp;<input class="form-control" type="text" name="" value="<%=objdestino.getDepartamento()%>"></h5>                      
            <h5>Proveedor: &nbsp;<input class="form-control" type="text" name="" value="<%=objdestino.getRazon_social()%>"></h5>                      
            <h5>Fecha: &nbsp;<input class="form-control" type="text" name="" value="<%=objdestino.getFecha()%>"></h5>                      
            <h5>Seleccionar cantidad a reservar<input class="form-control" type="number" name="cantidad" id="cantidad" ></h5>

            <input type="submit" class="btn btn-success btn-lg btn-block" onclick="reservarDestino()" value="Reservar destino">
        </form>

                                                                  <!--Scripts-->
        <script src="https://kit.fontawesome.com/1a98240850.js" crossorigin="anonymous"></script>  
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
        <!-- JAVASCRIPTS -->
        <script src="js/jquery.min.js"></script>
        <script src="js/jquery.backtotop.js"></script>
        <script src="js/jquery.mobilemenu.js"></script>  

    </body>
</html>
