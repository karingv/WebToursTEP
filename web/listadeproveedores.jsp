<%@page import="Modelo.Proveedor"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%!
    ArrayList<Proveedor> listaproveedor;
%>
<%
    listaproveedor = (ArrayList<Proveedor>) request.getAttribute("listaproveedor");

%>
<%@page session="true" %>
<!DOCTYPE html>
<html>
     <head>
<meta charset="UTF-8">
<title>Lista de provedores</title>

<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">

<link rel="stylesheet" type="text/css" media="all" href="css/paginaprincipal.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/all.css">
</head>


    <script>
        function nuevoproveedor() {
            document.form.action = "<%=request.getContextPath()%>/proveedorServlet";
            document.form.method = "POST";
            document.form.op.value = "1";
            document.form.submit();
        }
        function eliminarproveedor(idproveedor) {
            document.form.action = "<%=request.getContextPath()%>/proveedorServlet";
            document.form.method = "POST";
            document.form.op.value = "3";
            document.form.idproveedor.value = idproveedor;
            document.form.submit();
            window.alert("¡ELIMINAR PROVEDOR!");

        }
        function modificarproveedor(idproveedor, ruc, razon_social, correo, telefono, costo) {
            document.form.action = "<%=request.getContextPath()%>/proveedorServlet";
            document.form.method = "POST";
            document.form.op.value = "4";
            document.form.idproveedor.value = idproveedor;
            document.form.ruc.value = ruc;
            document.form.razon_social.value = razon_social;
            document.form.correo.value = correo;
            document.form.telefono.value = telefono;
            document.form.costo.value = costo;
            document.form.submit();
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
    <body>
        
    <div class="bgded" style="background-image:url('img/principal/01.jpg'); height: 910px">  
        
                      <!-- BARRA  MENU SUPERIOR -->  
        <div class="wrapper row1">
            <header id="header" class="hoc clear"> 
              <!-- ################################################################################################ -->
              <div id="logo" class="fl_left">
                  <h1><a onclick="regresarindexAdmin()">TEP PERU</a></h1>
              </div>
              <nav id="mainav" class="fl_right">
                <ul class="clear">
                  <li><a onclick="regresarindexAdmin()">Usuarios</a></li>
                  <li><a onclick="verDestinos()">Destinos</a></li>
                  <li><a onclick="verReservas()">Reservas</a></li>
                  <li class="active"><a class="drop" >BIENVENIDO</a>
                      <ul> 
  <li><%  if (session.getAttribute("logueado") != null) {%><a>Bienvenido: <%=session.getAttribute("usuario_sesion")%></a></li>
  <li><a onclick="salir()">Salir</a></li>                    
                      </ul>
                  </li>
                   <% }%>
                </ul>
                      
              </nav>
              <!-- ################################################################################################ -->
            </header>
        </div>
        
    <div class="container"">  
        <h1>Lista de proveedores</h1>

        <form name="form">
            <input type="hidden"  name="op"> 
            <input type="hidden"  name="idproveedor" >
            <input type="hidden"  name="ruc" >
            <input type="hidden"  name="razon_social" >
            <input type="hidden"  name="correo" >
            <input type="hidden"  name="telefono" >
            <input type="hidden"  name="costo" >

            <div class="panel-body">
                <button class="btn btn-warning style"  onclick="nuevoproveedor()" >Agregar proveedor</button>                           
            </div>
            <div class="table-responsive">
            <table class="table table-hover table-sm">
                <thead>
                    <tr>
                        <th>Código proveedor</th>
                        <th>Ruc</th>
                        <th>Razón Social</th>
                        <th>Correo</th>
                        <th>Telefono</th>
                        <th>Costo</th>
                        <th>Modificar</th>
                        <th>Eliminar</th>
                    </tr>
                </thead>
                <tbody>
                    <%                            for (Proveedor obj : listaproveedor) {
                    %> 
                    <tr>
                        <td><%=obj.getIdproveedor()%></td>
                        <td><%=obj.getRuc()%></td>
                        <td><%=obj.getRazon_social()%></td>
                        <td><%=obj.getCorreo()%></td>
                        <td><%=obj.getTelefono()%></td>
                        <td><%=obj.getCosto()%></td>

                        <td><button class="btn btn-primary" onclick="modificarproveedor('<%=obj.getIdproveedor()%>', '<%=obj.getRuc()%>', '<%=obj.getRazon_social()%>', '<%=obj.getCorreo()%>', '<%=obj.getTelefono()%>', '<%=obj.getCosto()%>')">Modificar</button></td>
                        <td><button class="btn btn-danger" onclick="eliminarproveedor(<%=obj.getIdproveedor()%>)">Eliminar</button></td>
                    </tr>
                    <% }%>
                </tbody> 

            </table>
            </div>    

        </form>
                
        </div>        
                                       <!--Scripts-->
        <script src="https://kit.fontawesome.com/1a98240850.js" crossorigin="anonymous"></script>  
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
        <!-- JAVASCRIPTS -->
        <script src="js/jquery.min.js"></script>
        <script src="js/jquery.backtotop.js"></script>
        <script src="js/jquery.mobilemenu.js"></script>
        
    </div>
    </body>
</html>
