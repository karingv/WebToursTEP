package Controlador;

import Modelo.ModeloUsuario;
import Modelo.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;


public class usuarioServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession sesion = request.getSession(true);
        String opcad = request.getParameter("op");
        String pagina = "";
        int op = Integer.parseInt(opcad);
        switch (op) {
            case 1 ->  {
                int rol = Integer.parseInt(request.getParameter("rolusuario"));
                String usuario = request.getParameter("usuario");
                String contraseña = request.getParameter("password");
                ModeloUsuario objmodelousuario = new ModeloUsuario();

                boolean estado;

                Usuario objusuario = new Usuario();
                objusuario.setId_rol(rol);
                objusuario.setUsuario(usuario);
                objusuario.setContraseña(contraseña);

                int idcliente = objmodelousuario.codigoUsuario(usuario);

                estado = objmodelousuario.validarAcceso(objusuario);

                sesion.setAttribute("idcliente", idcliente);

                if (estado) {
                    if (rol == 2) {
                        ArrayList listausuarios = objmodelousuario.listarUsuarios();
                        request.setAttribute("listausuarios", listausuarios);
                        pagina = "/indexAdmin.jsp";

                    } else {

                        ModeloDestino objmodelodestino = new ModeloDestino();
                        ArrayList listaDestinos = objmodelodestino.listarDestinos();
                        request.setAttribute("listadestinos", listaDestinos);

                        pagina = "/indexLogueado.jsp";
                    }
                    request.setAttribute("rol", rol);
                    sesion.setAttribute("logueado", "1");
                    sesion.setAttribute("usuario_sesion", usuario);
                    sesion.setAttribute("rol", rol);
                } else {
                    pagina = "/login.jsp";
                    request.setAttribute("mensaje", "¡Usuario o contraseña incorrecta!");
                }
            }
            case 2 ->  {
                pagina = "/registro.jsp";
            }
            case 3 ->  {
                String nombres = request.getParameter("nombres");
                String apellidos = request.getParameter("apellidos");
                String dni = request.getParameter("dni");
                int numerovacunas = Integer.parseInt(request.getParameter("numerovacunas"));
                LocalDate fecha_nac = LocalDate.parse(request.getParameter("fecha_nac"));
                String celular = request.getParameter("celular");
                String correo = request.getParameter("correo");
                String usuario = request.getParameter("usuario");
                String contraseña = request.getParameter("contraseña");
                int rol = 1;
                Usuario objusuario = new Usuario(nombres, apellidos, dni, numerovacunas, fecha_nac, celular, correo, usuario, contraseña, rol);
                ModeloUsuario objmodelusuario = new ModeloUsuario();
                objmodelusuario.insertarUsuario(objusuario);
                

                pagina = "/login.jsp";

            }
            case 4 ->  {
                int idcliente = Integer.parseInt(request.getParameter("idcliente"));
                Usuario objusuario = new Usuario();
                objusuario.setIdcliente(idcliente);
                ModeloUsuario objmodelousuario = new ModeloUsuario();
                objmodelousuario.eliminarUsuario(objusuario);
                ArrayList listausuarios = objmodelousuario.listarUsuarios();
                request.setAttribute("listausuarios", listausuarios);
                int rol = Integer.parseInt(sesion.getAttribute("rol").toString());
                request.setAttribute("rol", rol);
                pagina = "/indexAdmin.jsp";
            }
            case 5 ->  {
                int idcliente = Integer.parseInt(request.getParameter("idcliente"));
                String nombres = request.getParameter("nombres");
                String apellidos = request.getParameter("apellidos");
                String dni = request.getParameter("dni");
                int numerovacunas = Integer.parseInt(request.getParameter("numerovacunas"));
                LocalDate fecha_nac = LocalDate.parse(request.getParameter("fecha_nac"));
                String celular = request.getParameter("celular");
                String correo = request.getParameter("correo");
                String usuario = request.getParameter("usuario");
                String contraseña = request.getParameter("contraseña");
                int rol = Integer.parseInt(request.getParameter("rol"));
                Usuario objusuario = new Usuario(idcliente, nombres, apellidos, dni, numerovacunas, fecha_nac, celular, correo, usuario, contraseña, rol);
                request.setAttribute("datos", objusuario);
                pagina = "/modificar.jsp";
            }
            case 6 ->  {
                int idcliente = Integer.parseInt(request.getParameter("idcliente"));
                String nombres = request.getParameter("nombres");
                String apellidos = request.getParameter("apellidos");
                String dni = request.getParameter("dni");
                int numerovacunas = Integer.parseInt(request.getParameter("numerovacunas"));
                LocalDate fecha_nac = LocalDate.parse(request.getParameter("fecha_nac"));
                String celular = request.getParameter("celular");
                String correo = request.getParameter("correo");
                String usuario = request.getParameter("usuario");
                String contraseña = request.getParameter("contraseña");
                int rol = Integer.parseInt(request.getParameter("rol"));
                Usuario objusuario = new Usuario(idcliente, nombres, apellidos, dni, numerovacunas, fecha_nac, celular, correo, usuario, contraseña, rol);
                ModeloUsuario objmodelousuario = new ModeloUsuario();
                objmodelousuario.modificarUsuario(objusuario);
                
                ArrayList listausuarios = objmodelousuario.listarUsuarios();
                request.setAttribute("listausuarios", listausuarios);
                sesion.getAttribute("rol");
                request.setAttribute("rol", rol);
                pagina = "/indexAdmin.jsp";
            }
            case 7 ->  {
                int idcliente = Integer.parseInt(sesion.getAttribute("idcliente").toString());
                ModeloReserva objmodeloreserva = new ModeloReserva();
                ArrayList listareservas = objmodeloreserva.listarReservasxCliente(idcliente);
                request.setAttribute("listareservas", listareservas);
                pagina = "/historial.jsp";
            }
            case 8 ->  {
                sesion.invalidate();
                pagina = "/index.jsp";
            }
            case 9 ->  {
                int rol = Integer.parseInt(sesion.getAttribute("rol").toString());
                pagina = "/indexLogueado.jsp";
                request.setAttribute("rol", rol);
                ModeloDestino objmodelodestino = new ModeloDestino();
                ArrayList listaDestinos = objmodelodestino.listarDestinos();
                request.setAttribute("listadestinos", listaDestinos);
            }

        }
        getServletContext().getRequestDispatcher(pagina).forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
