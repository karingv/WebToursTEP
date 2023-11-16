<%@page import="Modelo.Reserva"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%!
    ArrayList<Reserva> listadereservas;
%>
<%
    listadereservas = (ArrayList<Reserva>) request.getAttribute("listadereservas");

%>
<%@page session="true" %>
<html>
       <head>
<meta charset="UTF-8">
<title>Lista de reservas</title>

<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">

<link rel="stylesheet" type="text/css" media="all" href="css/paginaprincipal.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/all.css">
</head>
    <script>
        function pagado(idreserva) {
            document.form.action = "<%=request.getContextPath()%>/reservaServlet";
            document.form.method = "POST";
            document.form.op.value = "3";
            document.form.idreserva.value = idreserva;
            document.form.submit();
        }
        function nopagado(idreserva) {
            document.form.action = "<%=request.getContextPath()%>/reservaServlet";
            document.form.method = "POST";
            document.form.op.value = "4";
            document.form.idreserva.value = idreserva;
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
     <body id="top">
        
         <div class="bgded" style="background-image:url('img/principal/01.jpg'); height: 710px">
             
             
                              <!-- BARRA  MENU SUPERIOR -->  
        <div class="wrapper row1">
            <header id="header" class="hoc clear"> 
              <!-- ################################################################################################ -->
              <div id="logo" class="fl_left">
                  <h1><a onclick="regresarindexAdmin()">TEP PERU</a></h1>
              </div>
              <nav id="mainav" class="fl_right">
                <ul class="clear">
                  <li><a onclick="regresarindexAdmin()">USUARIOS</a></li>
                  <li><a onclick="verProveedor()">Proveedor</a></li>
                  <li><a onclick="verDestinos()">Destinos</a></li>
                  
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
        
         <h1>Lista de RESERVAS </h1>
         <BR>
        <form name="form">
            <input type="hidden"  name="op">
            <input type="hidden"  name="idreserva">

            <table class="table table-hover table-sm">
                <thead>
                    <tr>
                        <th>Código de reserva</th>
                        <th>Código del cliente</th>
                        <th>Nombres</th>
                        <th>Apellidos</th>
                        <th>Destino</th>
                        <th>Departamento</th>
                        <th>Proveedor</th>
                        <th>Fecha de salida</th>
                        <th>Cantidad</th>
                        <th>Precio Total</th>
                        <th>Estado</th>
                        <th><center>Estado del pago de reserva</center></th>
                </tr>
                </thead>
                <tbody> 
                    <%                        for (Reserva obj : listadereservas) {
                            if (obj.getEstado().equals("pendiente")) {
                    %> 
                    <tr>
                        <td><%=obj.getIdreserva()%></td>
                        <td><%=obj.getIdcliente()%></td>
                        <td><%=obj.getNombres()%></td>
                        <td><%=obj.getApellidos()%></td>
                        <td><%=obj.getDestino()%></td>
                        <td><%=obj.getDepartamento()%></td>
                        <td><%=obj.getRazon_social()%></td>
                        <td><%=obj.getFecha()%></td>
                        <td><%=obj.getCantidad()%></td>
                        <td><%=obj.getPreciototal()%></td>
                        <td><%=obj.getEstado()%></td>
                        <td class="text-center">
                            <a class="btn btn-primary text-center" onclick="pagado(<%=obj.getIdreserva()%>)" style="" >Pagado</a>
                            <a class="btn btn-danger text-center" onclick="nopagado(<%=obj.getIdreserva()%>)" style="">No pagado</a>
                        </td>
                    </tr>
                    <%} else {%>
                    <tr>
                        <td><%=obj.getIdreserva()%></td>
                        <td><%=obj.getIdcliente()%></td>
                        <td><%=obj.getNombres()%></td>
                        <td><%=obj.getApellidos()%></td>
                        <td><%=obj.getDestino()%></td>
                        <td><%=obj.getDepartamento()%></td>
                        <td><%=obj.getRazon_social()%></td>
                        <td><%=obj.getFecha()%></td>
                        <td><%=obj.getCantidad()%></td>
                        <td><%=obj.getPreciototal()%></td>
                        <td><%=obj.getEstado()%></td>
                        <td>

                        </td>
                    </tr>


                    <%}
                        }%>
                </tbody> 
            </table>
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
