<%@page import="java.util.ArrayList"%>
<%@page import="Modelo.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>
<%!
    Destino objdestino;
    ArrayList<Departamento> listadepartamento;
    ArrayList<Proveedor> listaproveedor;

%>
<%
    objdestino = (Destino) request.getAttribute("datos");
    listadepartamento = (ArrayList<Departamento>) request.getAttribute("listadepartamento");
    listaproveedor = (ArrayList<Proveedor>) request.getAttribute("listaproveedor");

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
        function modificarDestino(iddestino) {
            document.form.action = "<%=request.getContextPath()%>/destinoServlet";
            document.form.method = "POST";
            document.form.op.value = "5";
            document.form.iddestino.value = iddestino;
            document.form.submit();
            window.alert("¡DESTINO MODIFICADO!");
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
                    <h2 class="text-light"><span class="linea">MODIFICAR destino </span></h2>
                    </div> 

        <form name="form">
            <input type="hidden"  name="op"> 
            <input type="hidden"  name="iddestino">


            <div>
                <div class="form-group mx-sm-4 pt-1">
                <label class="text-center">CODIGO</label>  
                <input class="form-control" type="text" disabled="false" value="<%=objdestino.getIddestino()%>" >
                </div>
                <div class="form-group mx-sm-4 pt-1">
                    
                    <label class="text-center">PROVEDOR</label> 
                    <select class="form-control" name="idproveedor">
                    <% for (Proveedor obj : listaproveedor) {%>
                    <option <%if (obj.getIdproveedor()==objdestino.getIdproveedor()) {%>selected="true"<%}%> value="<%=obj.getIdproveedor()  %>"><%=obj.getRazon_social()%></option> 
                    <% }%>
                </select>
                </div>
                
                <div class="form-group mx-sm-4 pt-1">
                    <label class="text-center">FECHA DE DESTINO</label> 
                <input class="form-control" type="date" name="fecha" value="<%=objdestino.getFecha()%>" >
                </div>
                
                <div class="form-group mx-sm-4 pt-1">
                    <label class="text-center">DEPARTAMENTO</label> 
                    <select class="form-control" name="iddepartamento">
                    <% for (Departamento obj : listadepartamento) {%>
                    <option <%if (obj.getIddepartamento()==objdestino.getIddepartamento()) {%>selected="true"<%}%> value="<%=obj.getIddepartamento()%>"><%=obj.getDepartamento()%></option> 
                    <% }%>
                </select>
                </div>
                
                <div class="form-group mx-sm-4 pt-1">
                <label class="text-center">DESTINO</label> 
                <input class="form-control" type="text" name="destino" value="<%=objdestino.getDestino()%>">
                </div>
                <div class="form-group mx-sm-4 pt-1">
                <label class="text-center">REGION</label> 
                <input class="form-control" type="text" name="region" value="<%=objdestino.getRegion()%>">
                </div>
                <div class="form-group mx-sm-4 pt-1">
                <label class="text-center">PROVINCIA</label> 
                <input class="form-control" type="text" name="provincia" value="<%=objdestino.getProvincia()%>" >
                </div>
                <div class="form-group mx-sm-4 pt-1">
                <label class="text-center">PRECIO</label> 
                <input class="form-control" type="number" name="precio" step="0.10" value="<%=objdestino.getPrecio()%>" >
               </div>
                <div class="form-group mx-sm-4 pt-1">
                   
                <input class="btn btn-success btn-lg btn-block" type="submit" onclick="modificarDestino('<%=objdestino.getIddestino()%>')" value="modificar">
                 </div>
          </div> 
        </form>
            
            
            
                                                            <!--Scripts-->
        <script src="https://kit.fontawesome.com/1a98240850.js" crossorigin="anonymous"></script>  
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
        <!-- JAVASCRIPTS -->
        <script src="js/jquery.min.js"></script>
        <script src="js/jquery.backtotop.js"></script>
        <script src="js/jquery.mobilemenu.js"></script>
       
        </div>
    </div>
 </div>
    </body>
</html>
