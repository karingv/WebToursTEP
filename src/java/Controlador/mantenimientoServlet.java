package Controlador;

import Modelo.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;


public class mantenimientoServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession sesion = request.getSession(true);
        String opcad = request.getParameter("op");
        int op = Integer.parseInt(opcad);
        String pagina = "";

        switch (op) {
            case 1 ->  {
                pagina = "/agregarUsuario.jsp";
            }
            case 2 ->  {
                String nombres = request.getParameter("nombres");
                String apellidos = request.getParameter("apellidos");
                String dni = request.getParameter("dni");
                int numerovacunas = Integer.parseInt(request.getParameter("numerovacunas"));
                LocalDate fecha_nac = LocalDate.parse(request.getParameter("fecha_nac"));
                String celular = request.getParameter("celular");
                String correo = request.getParameter("correo");
                String usuario = request.getParameter("usuario");
                String contraseña = request.getParameter("contraseña");
                int rol = Integer.parseInt(request.getParameter("id_rol"));
                Usuario objusuario = new Usuario(nombres, apellidos, dni, numerovacunas, fecha_nac, celular, correo, usuario, contraseña, rol);
                ModeloUsuario objmodelousuario = new ModeloUsuario();
                objmodelousuario.insertarUsuario(objusuario);
            
                ArrayList listausuarios = objmodelousuario.listarUsuarios();
                request.setAttribute("listausuarios", listausuarios);
                pagina = "/indexAdmin.jsp";
            }
            case 3 ->  {
                ModeloUsuario objmodelousuario = new ModeloUsuario();
                ArrayList listausuarios = objmodelousuario.listarUsuarios();
                request.setAttribute("listausuarios", listausuarios);
                pagina = "/indexAdmin.jsp";
            }
            case 4 ->  {
                ModeloReserva objmodeloreserva = new ModeloReserva();
                ArrayList listadereservas = objmodeloreserva.listarTodasLasReservas();
                request.setAttribute("listadereservas", listadereservas);
                pagina = "/listadereservas.jsp";
            }
            case 5 ->  {
                ModeloDestino objmodelodestino = new ModeloDestino();
                ArrayList listadestinos= objmodelodestino.listarDestinos();
                request.setAttribute("listadestinos", listadestinos);
                pagina = "/listadedestinos.jsp";
            }
            case 6 ->  {
                ModeloProveedor objmodeloproveedor = new ModeloProveedor();
                ArrayList listaproveedor= objmodeloproveedor.listarProveedor();
                request.setAttribute("listaproveedor", listaproveedor);
                pagina = "/listadeproveedores.jsp";
            }
            case 7 ->  {
                int rol = Integer.parseInt(sesion.getAttribute("rol").toString());
                request.setAttribute("rol", rol);
                ModeloUsuario objmodelousuario = new ModeloUsuario();
                ArrayList listausuarios = objmodelousuario.listarUsuarios();
                request.setAttribute("listausuarios", listausuarios);
                pagina = "/indexAdmin.jsp";
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
