
package Modelo;

import Util.conexionBD;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


public class ModeloProveedor {
    Connection cn = null;
    PreparedStatement pt = null;
    ResultSet rs = null;
    ArrayList<Proveedor> lista = null;
    Proveedor objproveedor = null;
    String mensaje;

    public ArrayList<Proveedor> listarProveedor() {
        try {
            cn = conexionBD.getConexionBD();
            pt = cn.prepareStatement("select * from proveedor");
            rs = pt.executeQuery();
            lista = new ArrayList<>();

            while (rs.next()) {
                objproveedor = new Proveedor();
                objproveedor.setIdproveedor(rs.getInt(1));
                objproveedor.setRuc(rs.getString(2));
                objproveedor.setRazon_social(rs.getString(3));
                objproveedor.setCorreo(rs.getString(4));
                objproveedor.setTelefono(rs.getString(5));
                objproveedor.setCosto(rs.getDouble(6));
                lista.add(objproveedor);
            }
            pt.close();
            rs.close();
            cn.close();
        } catch (SQLException e) {
            mensaje = e.getMessage();
        }
        return lista;
    }
    
    public Proveedor buscarProveedorxId(int idproveedor){
        try {
            cn = conexionBD.getConexionBD();
            pt = cn.prepareStatement("select * from proveedor where idproveedor="+idproveedor+" ");
            rs = pt.executeQuery();
            
            while (rs.next()) {
                objproveedor = new Proveedor();
                objproveedor.setIdproveedor(rs.getInt(1));
                objproveedor.setRuc(rs.getString(2));
                objproveedor.setRazon_social(rs.getString(3));
                objproveedor.setCorreo(rs.getString(4));
                objproveedor.setTelefono(rs.getString(5));
                objproveedor.setCosto(rs.getDouble(6));     
            
            }
            pt.close();
            rs.close();
            cn.close();
            
        } catch (SQLException e) {
            mensaje = e.getMessage();
        }
        return objproveedor;
    }
    
    
    
    public int insertarProveedor(Proveedor objproveedor){
        int estado=0;
        try {
            cn=conexionBD.getConexionBD();
            pt=cn.prepareStatement("insert into proveedor(idproveedor,ruc,razon_social,correo,telefono,costo) VALUES(?,?,?,?,?,?);");
            
            pt.setInt(1, objproveedor.getIdproveedor());
            pt.setString(2, objproveedor.getRuc());
            pt.setString(3, objproveedor.getRazon_social());
            pt.setString(4, objproveedor.getCorreo());
            pt.setString(5, objproveedor.getTelefono());
            pt.setDouble(6, objproveedor.getCosto());
            estado=pt.executeUpdate();
            pt.close();
            cn.close();
        } catch (SQLException e) {
            mensaje = e.getMessage();
        }
        return estado;
    }
    
    public int modificarProveedor(Proveedor objproveedor){
        int estado=0;
        try {
            cn=conexionBD.getConexionBD();
            pt=cn.prepareStatement("update proveedor set ruc=?, razon_social=?, correo=?, telefono=?, costo=? where idproveedor='"+objproveedor.getIdproveedor()+"';");
            
            pt.setString(1, objproveedor.getRuc());
            pt.setString(2, objproveedor.getRazon_social());
            pt.setString(3, objproveedor.getCorreo());
            pt.setString(4, objproveedor.getTelefono());
            pt.setDouble(5, objproveedor.getCosto());
            estado=pt.executeUpdate();
            pt.close();
            cn.close();
        } catch (SQLException e) {
            mensaje = e.getMessage();
        }
        return estado;
    }
    public int eliminarProveedor(int idproveedor){
        int estado=0;
        try {
            cn=conexionBD.getConexionBD();
            pt=cn.prepareStatement("delete from proveedor where idproveedor='"+idproveedor+"' ");
            estado=pt.executeUpdate();
            pt.close();
            cn.close();
        } catch (SQLException e) {
            mensaje = e.getMessage();
        }
        return estado;
    }
    
}
