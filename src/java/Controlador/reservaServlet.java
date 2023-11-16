package Controlador;

import Modelo.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

public class reservaServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession sesion = request.getSession(true);
        String opcad = request.getParameter("op");
        String pagina = "";
        int op = Integer.parseInt(opcad);

        switch (op) {
            case 1 ->  {
                int idcliente = Integer.parseInt(request.getParameter("idcliente"));
                int iddestino = Integer.parseInt(request.getParameter("iddestino"));

                Reserva objreserva = new Reserva();
                objreserva.setIdcliente(idcliente);
                objreserva.setIddestino(iddestino);

                ModeloDestino objmodelodestino = new ModeloDestino();

                ModeloUsuario objmodelousuario = new ModeloUsuario();

                request.setAttribute("datos", objreserva);
                request.setAttribute("destino", objmodelodestino.buscarDestinoxId(iddestino));
                request.setAttribute("usuario", objmodelousuario.buscarUsuarioxId(idcliente));

                pagina = "/reserva.jsp";
            }
            case 2 ->  {
                int idcliente = Integer.parseInt(request.getParameter("idcliente"));
                int destino = Integer.parseInt(request.getParameter("iddestino"));
                String estado = "pendiente";
                int cantidad = Integer.parseInt(request.getParameter("cantidad"));

                Reserva objreserva = new Reserva();
                objreserva.setIdcliente(idcliente);
                objreserva.setIddestino(destino);
                objreserva.setEstado(estado);
                objreserva.setCantidad(cantidad);

                ModeloReserva objmodeloreserva = new ModeloReserva();
                objmodeloreserva.insertarReservarDestino(objreserva);
                /*JOptionPane.showMessageDialog(null, "Destino reservado \n Proceso de reserva pendiente de pago"); */

                ModeloDestino objmodelodestino = new ModeloDestino();
                ArrayList listaDestinos = objmodelodestino.listarDestinos();
                request.setAttribute("listadestinos", listaDestinos);

                int rol = Integer.parseInt(sesion.getAttribute("rol").toString());
                pagina = "/indexLogueado.jsp";
                request.setAttribute("rol", rol);
            }
            case 3 ->  {
                String estado = "pagado";
                int idreserva = Integer.parseInt(request.getParameter("idreserva"));
                ModeloReserva objmodeloreserva = new ModeloReserva();
                objmodeloreserva.estadoReserva(idreserva, estado);
                ArrayList listadereservas = objmodeloreserva.listarReservas();
                request.setAttribute("listadereservas", listadereservas);
                pagina = "/listadereservas.jsp";
            }
            case 4 ->  {
                String estado = "no pagado";
                int idreserva = Integer.parseInt(request.getParameter("idreserva"));
                ModeloReserva objmodeloreserva = new ModeloReserva();
                objmodeloreserva.estadoReserva(idreserva, estado);
                ArrayList listadereservas = objmodeloreserva.listarReservas();
                request.setAttribute("listadereservas", listadereservas);
                pagina = "/listadereservas.jsp";
            }
            case 5 ->  {
                int idreserva = Integer.parseInt(request.getParameter("idreserva"));
                int idcliente = Integer.parseInt(request.getParameter("idcliente"));
                ModeloReserva objmodeloreserva = new ModeloReserva();
                objmodeloreserva.eliminarReserva(idreserva);
                ArrayList listareservas = objmodeloreserva.listarReservasxDestino(idcliente);
                request.setAttribute("listareservas", listareservas);
                pagina = "/historial.jsp";
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
