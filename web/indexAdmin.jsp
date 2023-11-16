<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>
<%@page import="Modelo.Usuario"%>
<%@page import="java.util.ArrayList"%>
<%!
    ArrayList<Usuario> listausuarios;
    
%>
<%
    listausuarios = (ArrayList<Usuario>) request.getAttribute("listausuarios");
  
%>

<html lang="es">
   <head>
<meta charset="UTF-8">
<title>Pagina principal</title>

<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">

<link rel="stylesheet" type="text/css" media="all" href="css/paginaprincipal.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/all.css">
</head>
    <script>
        function nuevousuario() {
            document.form.action = "<%=request.getContextPath()%>/mantenimientoServlet";
            document.form.method = "POST";
            document.form.op.value = "1";
            document.form.submit();
        }
        function eliminar(idcliente) {
            document.form.action = "<%=request.getContextPath()%>/usuarioServlet";
            document.form.method = "POST";
            document.form.op.value = "4";
            document.form.idcliente.value = idcliente;
            document.form.submit();
            window.alert("¡USUARIO ELIMINADO!");
        }
        function modificar(idcliente, nombres, apellidos, dni, numerovacunas, fecha_nac, celular, correo, usuario, contraseña, rol) {
            document.form.action = "<%=request.getContextPath()%>/usuarioServlet";
            document.form.method = "GET";
            document.form.op.value = "5";
            document.form.idcliente.value = idcliente;
            document.form.nombres.value = nombres;
            document.form.apellidos.value = apellidos;
            document.form.dni.value = dni;
            document.form.numerovacunas.value = numerovacunas;
            document.form.fecha_nac.value = fecha_nac;
            document.form.celular.value = celular;
            document.form.correo.value = correo;
            document.form.usuario.value = usuario;
            document.form.contraseña.value = contraseña;
            document.form.rol.value = rol;
            document.form.submit();
        }
        function verReservas() {
            document.form.action = "<%=request.getContextPath()%>/mantenimientoServlet";
            document.form.method = "GET";
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
                  <li><a onclick="verProveedor()">Proveedor</a></li>
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
                <h1>Lista de usuarios</h1>
        <form name="form">
            <input type="hidden"  name="op"> 
            <input type="hidden"  name="idcliente" >
            <input type="hidden"  name="nombres" >
            <input type="hidden"  name="apellidos" >
            <input type="hidden"  name="dni" >
            <input type="hidden"  name="numerovacunas" >
            <input type="hidden"  name="fecha_nac" >
            <input type="hidden"  name="celular" >
            <input type="hidden"  name="correo" >
            <input type="hidden"  name="usuario" >
            <input type="hidden"  name="contraseña" >
            <input type="hidden"  name="rol" >

            <div class="panel-body">
                <button class="btn btn-warning style"  onclick="nuevousuario()" >Agregar usuario</button>                           
            </div>
            
            <div class="table-responsive">
            <table class="table table-hover table-sm">
                <thead>
                    <tr >
                        <th>Código</th>
                        <th>Nombres</th>
                        <th>Apellidos</th>
                        <th>DNI</th>
                        <th>Numero vacunas</th>
                        <th>Fecha de Nacimiento</th>
                        <th>Celular</th>
                        <th>Correo</th>
                        <th>Rol</th>
                        <th>Modificar</th>
                        <th>Eliminar</th>
                    </tr>
                </thead>
                <tbody>
                    <%                            for (Usuario obj : listausuarios) {
                    %> 
                    <tr>
                        <td><%=obj.getIdcliente()%></td>
                        <td><%=obj.getNombres()%></td>
                        <td><%=obj.getApellidos()%></td>
                        <td><%=obj.getDni()%></td>
                        <td><%=obj.getNumerovacunas()%></td>
                        <td><%=obj.getFecha_nac()%></td>
                        <td><%=obj.getCelular()%></td>
                        <td><%=obj.getCorreo()%></td>
                        <%
                            switch (obj.getId_rol()) {
                                case 1:%><td>Cliente</td><%;
                                        break;
                                    case 2:%><td>Administrador</td><%;
                                                break;
                                        }%>
                        <td><button class="btn btn-primary" onclick="modificar('<%=obj.getIdcliente()%>', '<%=obj.getNombres()%>', '<%=obj.getApellidos()%>', '<%=obj.getDni()%>', '<%=obj.getNumerovacunas()%>', '<%=obj.getFecha_nac()%>', '<%=obj.getCelular()%>', '<%=obj.getCorreo()%>', '<%=obj.getUsuario()%>', '<%=obj.getContraseña()%>', '<%=obj.getId_rol()%>')">Modificar</button></td>
                        <td><button class="btn btn-danger" onclick="eliminar(<%=obj.getIdcliente()%>)">Eliminar</button></td>
                    </tr>
                    <% }%>
                </tbody> 

            </table>
            </div>

        </form>
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
