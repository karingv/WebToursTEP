
package Controlador;

import Modelo.ModeloProveedor;
import Modelo.Proveedor;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import javax.swing.JOptionPane;


public class proveedorServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession sesion = request.getSession(true);
        String opcad = request.getParameter("op");
        String pagina = "";
        int op = Integer.parseInt(opcad);

        switch (op) {
            case 1 ->  {
                pagina = "/agregarProveedor.jsp";
            }
            case 2 ->  {
                String ruc = request.getParameter("ruc");
                String razon_social = request.getParameter("razon_social");
                String correo = request.getParameter("correo");
                String telefono = request.getParameter("telefono");
                Double costo = Double.parseDouble(request.getParameter("costo"));
                Proveedor objproveedor = new Proveedor(ruc, razon_social, correo, telefono, costo);
                ModeloProveedor objmodeloproveedor = new ModeloProveedor();
                objmodeloproveedor.insertarProveedor(objproveedor);
 
                ArrayList listaproveedor = objmodeloproveedor.listarProveedor();
                request.setAttribute("listaproveedor", listaproveedor);
                pagina = "/listadeproveedores.jsp";
            }
            case 3 ->  {
                int idproveedor = Integer.parseInt(request.getParameter("idproveedor"));
                Proveedor objproveedor = new Proveedor();
                objproveedor.setIdproveedor(idproveedor);
                ModeloProveedor objmodeloproveedor = new ModeloProveedor();
                objmodeloproveedor.eliminarProveedor(idproveedor);
                ArrayList listaproveedor = objmodeloproveedor.listarProveedor();
                request.setAttribute("listaproveedor", listaproveedor);
                
                pagina = "/listadeproveedores.jsp";
            }
            case 4 ->  {
                int idproveedor = Integer.parseInt(request.getParameter("idproveedor"));
                String ruc = request.getParameter("ruc");
                String razon_social = request.getParameter("razon_social");
                String correo = request.getParameter("correo");
                String telefono = request.getParameter("telefono");
                Double costo = Double.parseDouble(request.getParameter("costo"));
                Proveedor objproveedor = new Proveedor(idproveedor,ruc, razon_social, correo, telefono, costo);
                request.setAttribute("datos", objproveedor);
                pagina = "/modificarProveedor.jsp";
            }
            case 5 ->  {
                int idproveedor = Integer.parseInt(request.getParameter("idproveedor"));
                String ruc = request.getParameter("ruc");
                String razon_social = request.getParameter("razon_social");
                String correo = request.getParameter("correo");
                String telefono = request.getParameter("telefono");
                Double costo = Double.parseDouble(request.getParameter("costo"));
                Proveedor objproveedor = new Proveedor(idproveedor,ruc, razon_social, correo, telefono, costo);
                ModeloProveedor objmodeloproveedor = new ModeloProveedor();
                objmodeloproveedor.modificarProveedor(objproveedor);
               
                ArrayList listaproveedor = objmodeloproveedor.listarProveedor();
                request.setAttribute("listaproveedor", listaproveedor);
                pagina = "/listadeproveedores.jsp";
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
