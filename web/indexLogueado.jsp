<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Modelo.*"%>

<!DOCTYPE html>
<%!
    ArrayList<Destino> listaDestinos;
    int rol;
%>
<%
    listaDestinos = (ArrayList<Destino>) request.getAttribute("listadestinos");
   if (session.getAttribute("logueado") == null){
      response.sendRedirect("login.jsp");
    }else{
    rol = (int) request.getAttribute("rol");
%>
<html>
   <head>
<meta charset="UTF-8">
<title>Pagina principal Logeado</title>

<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">

<link rel="stylesheet" type="text/css" media="all" href="css/paginaprincipal.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/all.css">
</head>


    <script>
        function reservar1(iddestino, idcliente) {
            document.form.action = "<%=request.getContextPath()%>/reservaServlet";
            document.form.method = "POST";
            document.form.op.value = "1";
            document.form.iddestino.value = iddestino;
            document.form.idcliente.value = idcliente;
            document.form.submit();
        }
        function historial() {
            document.form.action = "<%=request.getContextPath()%>/usuarioServlet";
            document.form.method = "POST";
            document.form.op.value = "7";
            document.form.submit();
        }
        function salir() {
            document.form.action = "<%=request.getContextPath()%>/usuarioServlet";
            document.form.method = "GET";
            document.form.op.value = "8";
            document.form.submit();
        }

    </script>
    
    <body id="top">
    
    <div class="bgded" style="background-image:url('img/principal/01.jpg'); height: 710px"> 
        
         <div class="wrapper row1">
            <header id="header" class="hoc clear"> 
              <!-- ################################################################################################ -->
              <div id="logo" class="fl_left">
                  <h1><a href="indexLogueado.jsp">TEP PERU</a></h1>
              </div>
              <nav id="mainav" class="fl_right">
                <ul class="clear">
                  
                  <li><a class="drop">REDES SOCIALES</a>
                    <ul>
                      <li><a href="https://twitter.com/jhohenn">TWITTER</a></li>
                      <li><a href="https://www.facebook.com/trekentrepatas/">FACEBOOK</a></li>
                    </ul>
                  </li>
                  <li><a href="#nosotros">Nosotros</a></li>
                  <li><a href="#contactox">Contacto</a></li>
                  <li class="active"><a class="drop" >BIENVENIDO</a>
                       <ul> 
                         <li><%  if (session.getAttribute("logueado") != null) {%><a>Bienvenido: <%=session.getAttribute("usuario_sesion")%></a></li>
                         <li><a onclick="historial()" >Historial de viajes</a> </li> 
                         <li><a onclick="salir()">Salir</a></li>  
                          
                        </ul>
                   </li>
                   <% }%>
                </ul>
              </nav>
              <!-- ################################################################################################ -->
            </header>
        </div>
    <div class="wrapper">
            <article id="pageintro" class="hoc clear"> 
              <!-- ################################################################################################ -->
              
              <div class="contenedor">
              <div class="transbox">
                  <img src="img/principal/012.jpg">
                <br>  <br>
                <h3 class="heading text-center alert-info">TREK ENTRE PATAS</h3>
                <p>Hola! bienvenidos a esta hermosa comunidad de viajeros, dónde publicamos constantemente las hermosas rutas de nuestro país, hacemos salidas cada fin de semana.</p>
              </div>              
                  <div class="logoxx">
                  <img src="img/principal/usuario.jpg">
                  </div>
              </div>
            <!-- ################################################################################################ -->
            </article>
        </div>
        <div class="logox1">
            <h1 class="bg-success text-center shadow p-3 mb-0 bg-body rounded">DESTINOS VIGENTES A LA FECHA</h1>
        </div>
    </div>
        
 <div class="logox" style="background-image:url('img/principal/05.png');">   
    <div class="row" style="height: 950px ; max-width: 1250px; margin: auto" >    
       
        <div class="col-x9-1 col-lg-12 mt-5">
                <div class="card ">
                    <div class="card-header card-header-success bg-success">
                        <div class="ct-chart"></div>
                    </div>
                  
 <div class="container""> 
        <form name="form" action="" method="POST" >
            <input type="hidden" name="op">   
            <input type="hidden" name="idcliente" value="<%=session.getAttribute("idcliente")%>">
            <input type="hidden" name="iddestino" >
             <div class="table-responsive">
                 <div class="logox text-center"><img src="img/principal/bann.jpg"></div>
                 <br>
            <table class="table table-hover table-sm text-center">
                 
                <thead>
                    <tr>
                       
                            <th>Destino</th>
                            <th>Departamento</th>
                            <th>Fecha</th>
                            <th>Precio</th>
                           
                    </tr>
                </thead>
                 
                <tbody>
                    <%
                        for (Destino obj : listaDestinos) {
                    %>
                    <tr>
                            <td><%=obj.getDestino() %></td>
                            
                            <td><%=obj.getDepartamento() %></td>
                            <td><%=obj.getFecha() %></td>
                            <td><%=obj.getPrecio() %></td>  
                    <td><input type="submit" class="btn btn-success btn-lg btn-block m-0" onclick="reservar1(<%=obj.getIddestino()%>,<%=session.getAttribute("idcliente")%>)" value="RESERVAR DESTINO"></td>
                    
                     
                    </tr>
                    <% }%>
                </tbody>
               
            </table>
             </div>
        </form>
        </div>
                    
                    
                    <div class="card-footer">
                        <div class="stats">
                        <i class="material-icons "></i>Fecha limite de reserva hasta finales de julio
                        </div>
                    </div>
                </div>
            </div>
        
       
    </div>
</div>
                
                
                <div class="wrapper bgded overlay" style="background-image:url('img/principal/04.png');" id="nosotros">
      <div class="hoc container testimonials clear"> 
        <!-- ################################################################################################ -->
        <article class="one_half first"><img src="img/principal/100x100.png" alt="">
          <blockquote>
          <br>Todo comienza con un sueño y mi proposito siempre fue conocer lo grandiozo
               que es el Peru y compartirlo con todos para que vean lo grandiozo que es viajar por nuestro hermoso pais.
          </blockquote>
          <h5 class="heading">Guillermo palomino</h5>
          <em>GERENTE GENERAL</em></article>

        <article class="one_half"><img src="img/principal/100x1002.png" alt="">
          <blockquote>
          <BR>Siemppre quise saber la experiencia de ser libre , hoy en dia me siento mas libre que nunca al viajar por todo el pais experimentando muchas aventuras junto a TEP y me agrada mucho ello</blockquote>
          <h6 class="heading">Alejandra Portales</h6>
          <em>GUIA TURISTICA</em></article>
        <!-- ################################################################################################ -->
      </div>
    </div>
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<div class="wrapper row3 bg-white">
      <section class="hoc container clear"> 
        <!-- ################################################################################################ -->

        <div class="group latest">
         
            <article class="one_third first">
              <figure><a href="https://elcomercio.pe/vamos/peru/peru-peru-es-considerado-uno-de-los-destinos-ideales-para-el-avistamiento-de-aves-en-el-mundo-aves-avistamiento-de-aves-destino-turismo-noticia/?ref=ecr"><img src="img/principal/320x220-1.png" alt=""></a>
              <figcaption>
                <time datetime="2045-04-06T08:15+00:00"><strong>26</strong> <em>May</em></time>
              </figcaption>
            </figure>
            <div class="txtwrap">
              <h4 class="heading">Peru pais mundial del turismo</h4>
              <ul class="nospace meta">
                <li><i class="fa fa-user"></i> <a>Info</a></li>
                <li><i class="fa fa-tag"></i> <a>Noticias</a></li>
              </ul>
              <p>Perú es considerado uno de los destinos ideales para el avistamiento de aves en el mundo</p>
              <footer><a href="https://elcomercio.pe/vamos/peru/peru-peru-es-considerado-uno-de-los-destinos-ideales-para-el-avistamiento-de-aves-en-el-mundo-aves-avistamiento-de-aves-destino-turismo-noticia/?ref=ecr">Mas informacion</a></footer>
            </div>
          </article>
         
            <article class="one_third">
            <figure><a href="https://elcomercio.pe/economia/mincetur-publica-plan-de-emergencia-del-sector-turismo-para-impulsar-reactivacion-y-crecimiento-economico-rmmn-noticia/"><img src="img/principal/320x2202.jpg" alt=""></a>
              <figcaption>
                <time datetime="2045-04-05T08:15+00:00"><strong>05</strong> <em>May</em></time>
              </figcaption>
            </figure>
            <div class="txtwrap">
              <h4 class="heading">Reactivacion turistica</h4>
              <ul class="nospace meta">
                <li><i class="fa fa-user"></i> <a>info</a></li>
                <li><i class="fa fa-tag"></i> <a>Noticias</a></li>
              </ul>
              <p>Mincetur publica Plan de Emergencia del Sector Turismo para impulsar reactivación y crecimiento económico</p>
              <footer><a href="https://elcomercio.pe/economia/mincetur-publica-plan-de-emergencia-del-sector-turismo-para-impulsar-reactivacion-y-crecimiento-economico-rmmn-noticia/">Mas informacion</a></footer>
            </div>
          </article>
         
            <article class="one_third">
            <figure><a href="https://rpp.pe/economia/economia/turismo-mas-de-242000-turistas-internacionales-ingresaron-al-peru-en-el-primer-trimestre-del-ano-noticia-1403129"><img src="img/principal/320x2203.png" alt=""></a>
              <figcaption>
                <time datetime="2045-04-04T08:15+00:00"><strong>04</strong> <em>May</em></time>
              </figcaption>
            </figure>
            <div class="txtwrap">
              <h4 class="heading">Turismo de moda en Peru</h4>
              <ul class="nospace meta">
                <li><i class="fa fa-user"></i> <a>info</a></li>
                <li><i class="fa fa-tag"></i> <a>Noticias</a></li>
              </ul>
              <p>Turismo: Más de 242,000 turistas internacionales ingresaron al Perú en el primer trimestre del año.</p>
              <footer><a href="https://rpp.pe/economia/economia/turismo-mas-de-242000-turistas-internacionales-ingresaron-al-peru-en-el-primer-trimestre-del-ano-noticia-1403129">Mas informacion</a></footer>
            </div>
          </article>
        </div>
        <!-- ################################################################################################ -->
        <div class="clear"></div>
      </section>
    </div>
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<div class="wrapper row4">
  <footer id="footer" class="hoc clear"> 
    <!-- ################################################################################################ -->
    <div class="one_third first">
      <h6 class="heading">Sugerencias</h6>
      <p class="nospace btmspace-30"> Si deseas comunicarte directamente con el administrador y gerente dejanos tu email y nombre</p>
      
      <form method="post" action="index.jsp">
        <fieldset>
          <legend>Datos de contacto</legend>
          <input class="btmspace-15" type="text" value="" placeholder="Name">
          <input class="btmspace-15" type="text" value="" placeholder="Email">
          <button type="submit" value="submit">Enviar</button>
        </fieldset>
      </form>
    </div>
    
    <div class="one_third">
      <h6 class="heading">LEGALIDAD</h6>
      <ul class="nospace linklist">
        <li>
          <article>
            <h2 class="nospace font-x1"><a href="http://consultasenlinea.mincetur.gob.pe/set-regiones/(S(v1b5ee5mjjez1crdoaevwao5))/Reportes/WebReportes/RptListadoCoincidencias.aspx?StrTipo=1&Var=02|||TREK%20ENTRE%20PATAS|">CERTIFICADOS POR MINCETUR</a></h2>
            <time class="font-xs block btmspace-10" datetime="2022-05-30">Friday, 6<sup>th</sup> April 2022</time>
            <p class="nospace">Estamos registrados en el Ministerio de Comercio Exterior y Turismo</p>
          </article>
        </li>
        <li><a>Pagina oficial del MINCETUR</a></li>
        <li><a href="http://consultasenlinea.mincetur.gob.pe/set-regiones/(S(v1b5ee5mjjez1crdoaevwao5))/Reportes/WebReportes/RptFiltro.aspx?StrCodGrupo=02&NomGrupo=Agencias+de+Viajes+y+Turismo">Mas informacion</a></li>
      </ul>
    </div>
    
    <div class="one_third" name="contactox" id="contactox">
      <h6 class="heading">CONTACTANOS</h6>
      <ul class="nospace btmspace-30 linklist contact">
        <li><i class="fa fa-map-marker"></i>
          <address>
          Av. Independencia 100-152, Cercado de Lima 15487
          </address>
        </li>
        <li><i class="fa fa-phone"></i> 51 994 380 597</li>
        <li><i class="fa fa-envelope-o"></i>bboyguillermo@gmail.com</li>
      </ul>
      <ul class="faico clear">
        <li><a class="faicon-facebook" href="https://www.facebook.com/trekentrepatas/"><i class="fa fa-facebook"></i></a></li>
        <li><a class="faicon-twitter" href="https://twitter.com/EDICIONESREGION"><i class="fa fa-twitter"></i></a></li>
        <li><a class="faicon-google-plus"><i class="fa fa-google-plus"></i></a></li>
      </ul>
    </div>
    <!-- ################################################################################################ -->
  </footer>
</div>
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<div class="wrapper row5">
  <div id="copyright" class="hoc clear"> 
    <!-- ################################################################################################ -->
    <p class="fl_left">Copyright &copy; 2021 - Terminos reservados - <a href="#">UTP</a></p>
    <p class="fl_right">By <a target="_blank" href="index.jsp" title="Free Website Templates"> G5</a></p>
    <!-- ################################################################################################ -->
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
<%
    }
%>