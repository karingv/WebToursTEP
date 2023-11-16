<%@page import="Modelo.Destino"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%!
    ArrayList<Destino> listadestinos;
%>
<%
    listadestinos = (ArrayList<Destino>) request.getAttribute("listadestinos");

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
        function nuevodestino() {
            document.form.action = "<%=request.getContextPath()%>/destinoServlet";
            document.form.method = "POST";
            document.form.op.value = "2";
            document.form.submit();
           
        }
        function eliminardestino(iddestino) {
            document.form.action = "<%=request.getContextPath()%>/destinoServlet";
            document.form.method = "POST";
            document.form.op.value = "6";
            document.form.iddestino.value = iddestino;
            document.form.submit();
            window.alert("¡DESTINO ELIMINADO!");
        }
        function modificardestino( iddestino,idproveedor,fecha,iddepartamento, destino, region, provincia, precio) {
            document.form.action = "<%=request.getContextPath()%>/destinoServlet";
            document.form.method = "get";
            document.form.op.value = "4";
            document.form.iddestino.value = iddestino;
            document.form.idproveedor.value = idproveedor;
            document.form.fecha.value = fecha;
            document.form.iddepartamento.value = iddepartamento;
            document.form.destino.value = destino;
            document.form.region.value = region;
            document.form.provincia.value = provincia; 
            document.form.precio.value = precio;
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
                  <li><a onclick="verProveedor()">Proveedor</a></li>
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
        <h1>Lista de destinos</h1>

        <form name="form">
            <input type="hidden"  name="op"> 
            <input type="hidden"  name="iddestino" >
            <input type="hidden"  name="destino" >
            <input type="hidden"  name="fecha" >
            <input type="hidden"  name="iddepartamento" >
            <input type="hidden"  name="region" >
            <input type="hidden"  name="provincia" >
            <input type="hidden"  name="idproveedor" >
            <input type="hidden"  name="precio" >
        
                <div class="panel-body">
                    <button class="btn btn-warning style"  onclick="nuevodestino()" >Agregar destino</button>                           
                </div>
            <div class="table-responsive">
                <table class="table table-hover table-sm">
                    <thead>
                        <tr>
                            <th>Código destino</th>
                            <th>Destino</th>
                            <th>Fecha</th>
                            <th>Departamento</th>
                            <th>Region</th>
                            <th>Provincia</th>
                            <th>Proveedor</th>
                            <th>Costo del proveedor</th>
                            <th>Precio del destino</th>
                            <th>Modificar</th>
                            <th>Eliminar</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%                            for (Destino obj : listadestinos) {
                        %> 
                        <tr>
                            <td><%=obj.getIddestino()%></td>
                            <td><%=obj.getDestino() %></td>
                            <td><%=obj.getFecha() %></td>
                            <td><%=obj.getDepartamento() %></td>
                            <td><%=obj.getRegion() %></td>
                            <td><%=obj.getProvincia() %></td>
                            <td><%=obj.getRazon_social() %></td>
                            <td><%=obj.getCosto() %></td>
                            <td><%=obj.getPrecio() %></td> 

                            <td><button class="btn btn-primary" onclick="modificardestino('<%=obj.getIddestino()%>', '<%=obj.getIdproveedor()%>', '<%=obj.getFecha()%>', '<%=obj.getIddepartamento()%>','<%=obj.getDestino()%>', '<%=obj.getRegion()%>', '<%=obj.getProvincia()%>','<%=obj.getPrecio()%>')">Modificar</button></td>
                            <td><button class="btn btn-danger" onclick="eliminardestino(<%=obj.getIddestino()%>)">Eliminar</button></td>
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
