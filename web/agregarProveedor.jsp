<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>
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
        function agregarProveedor() {
            document.form.action = "<%=request.getContextPath()%>/proveedorServlet";
            document.form.method = "POST";
            document.form.op.value = "2";
            document.form.submit();
            window.alert("¡PROVEEDOR REGISTRADO!");
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
                    <h2 class="text-light"><span class="linea">Agregar Proveedor</span></h2>
                    </div> 
                    
                    <form name="form">
                        <input type="hidden"  name="op"> 
                        <div>
                            <div class="form-group mx-sm-4 pt-1">
                            <label>Ruc:</label>
                            <input class="form-control" type="text" name="ruc" placeholder="Escriba ruc">      
                            </div>
                            
                            <div class="form-group mx-sm-4 pt-1">
                            <label>Razón Social</label>
                            <input class="form-control" type="text" name="razon_social" placeholder="Escriba razón social">
                            </div><!-- comment -->
                            
                            
                            <div class="form-group mx-sm-4 pt-1">
                            <label>Correo:</label>
                            <input class="form-control" type="email" name="correo" placeholder="Escriba correo"> 
                            </div><!-- comment -->
                            
                            <div class="form-group mx-sm-4 pt-1">
                            <label>Teléfono:</label>
                            <input class="form-control" type="text" name="telefono" placeholder="Escriba telefono">
                            </div>
                            
                            <div class="form-group mx-sm-4 pt-1">
                            <label>Costo:</label>
                            <input class="form-control" type="number" name="costo" step="0.10" placeholder="Escriba el costo">
                            </div>
                            
                            <div class="form-group mx-sm-4 pt-1">
                            <input class="btn btn-success btn-lg btn-block" type="submit" onclick="agregarProveedor()" value="Agregar proveedor">
                            </div>
                            
                            <div class="form-group mx-sm-4 pt-1"> 
                                <button class="btn btn-success btn-lg btn-block"  onclick="regresarindexAdmin()" >Regresar</button>
                            </div>  
                        </div> 
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
