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

public class destinoServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession sesion = request.getSession(true);
        String opcad = request.getParameter("op");
        String pagina = "";
        int op = Integer.parseInt(opcad);

        switch (op) {
            case 1 ->  {
                ModeloDestino objmodelodestino = new ModeloDestino();
                ArrayList listaDestinos = objmodelodestino.listarDestinos();
                request.setAttribute("listadestinos", listaDestinos);
                pagina = "/indexLogueado.jsp";
            }
            case 2 ->  {
                ModeloProveedor objmodeloproveedor = new ModeloProveedor();
                ArrayList listaproveedor = objmodeloproveedor.listarProveedor();
                ModeloDepartamento objmodelodepartamento = new ModeloDepartamento();
                ArrayList listadepartamento = objmodelodepartamento.listarDepartamento();
                request.setAttribute("listaproveedor", listaproveedor);
                request.setAttribute("listadepartamento", listadepartamento);
                pagina = "/agregarDestino.jsp";
            }
            case 3 ->  {
                int idproveedor = Integer.parseInt(request.getParameter("idproveedor"));
                LocalDate fecha = LocalDate.parse(request.getParameter("fecha"));
                int iddepartamento = Integer.parseInt(request.getParameter("iddepartamento"));
                String destino = request.getParameter("destino");
                String region = request.getParameter("region");
                String provincia = request.getParameter("provincia");
                Double precio = Double.parseDouble(request.getParameter("precio"));
                Destino objdestino = new Destino(idproveedor, fecha, iddepartamento, destino, region, provincia, precio);
                ModeloDestino objmodelodestino = new ModeloDestino();
                objmodelodestino.insertarDestino(objdestino);
                
                ArrayList listadestinos = objmodelodestino.listarDestinos();
                request.setAttribute("listadestinos", listadestinos);
                pagina = "/listadedestinos.jsp";
            }
            case 4 ->  {
                int iddestino = Integer.parseInt(request.getParameter("iddestino"));
                int idproveedor = Integer.parseInt(request.getParameter("idproveedor"));
                LocalDate fecha = LocalDate.parse(request.getParameter("fecha"));
                int iddepartamento = Integer.parseInt(request.getParameter("iddepartamento"));
                String destino = request.getParameter("destino");
                String region = request.getParameter("region");
                String provincia = request.getParameter("provincia");
                Double precio = Double.parseDouble(request.getParameter("precio"));               
                Destino objdestino = new Destino(iddestino,idproveedor, fecha, iddepartamento, destino, region, provincia, precio);
                
                ModeloProveedor objmodeloproveedor = new ModeloProveedor();
                ArrayList listaproveedor = objmodeloproveedor.listarProveedor();
                ModeloDepartamento objmodelodepartamento = new ModeloDepartamento();
                ArrayList listadepartamento = objmodelodepartamento.listarDepartamento();
                
                request.setAttribute("listaproveedor", listaproveedor);
                request.setAttribute("listadepartamento", listadepartamento);
                request.setAttribute("datos", objdestino);
                pagina = "/modificarDestino.jsp";
            }
            case 5 ->  {
                int iddestino = Integer.parseInt(request.getParameter("iddestino"));
                int idproveedor = Integer.parseInt(request.getParameter("idproveedor"));
                LocalDate fecha = LocalDate.parse(request.getParameter("fecha"));
                int iddepartamento = Integer.parseInt(request.getParameter("iddepartamento"));
                String destino = request.getParameter("destino");
                String region = request.getParameter("region");
                String provincia = request.getParameter("provincia");
                Double precio = Double.parseDouble(request.getParameter("precio"));    
                Destino objdestino = new Destino(iddestino,idproveedor, fecha, iddepartamento, destino, region, provincia, precio);
                ModeloDestino objmodelodestino = new ModeloDestino();
                objmodelodestino.modificarDestino(objdestino);
               
                ArrayList listadestinos = objmodelodestino.listarDestinos();
                request.setAttribute("listadestinos", listadestinos);
                pagina = "/listadedestinos.jsp";
            }
            case 6 ->  {
                int iddestino = Integer.parseInt(request.getParameter("iddestino"));
                Destino objdestino = new Destino();
                objdestino.setIddestino(iddestino);
                ModeloDestino objmodelodestino = new ModeloDestino();
                objmodelodestino.eliminarDestino(iddestino);
                ArrayList listadestinos = objmodelodestino.listarDestinos();
                request.setAttribute("listadestinos", listadestinos);

                pagina = "/listadedestinos.jsp";
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
