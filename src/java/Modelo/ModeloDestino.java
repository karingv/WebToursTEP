package Modelo;

import Util.conexionBD;
import java.sql.*;
import java.time.LocalDate;
import java.util.*;

public class ModeloDestino {

    Connection cn = null;
    PreparedStatement pt = null;
    ResultSet rs = null;
    ArrayList<Destino> lista = null;
    Destino objdestino = null;
    String mensaje;
    int contador = 0;

    public ArrayList<Destino> listarDestinos() {
        try {
            cn = conexionBD.getConexionBD();
            pt = cn.prepareStatement("SELECT iddestino, destino, de.iddepartamento, de.departamento, provincia, region, p.idproveedor, p.razon_social, p.costo, precio, fecha FROM destino d INNER JOIN departamento de on(d.iddepartamento=de.iddepartamento) INNER JOIN proveedor p on(d.idproveedor=p.idproveedor);");
            rs = pt.executeQuery();
            lista = new ArrayList<>();

            while (rs.next()) {
                objdestino = new Destino();
                objdestino.setIddestino(rs.getInt(1));
                objdestino.setDestino(rs.getString(2));
                objdestino.setIddepartamento(rs.getInt(3));
                objdestino.setDepartamento(rs.getString(4));
                objdestino.setProvincia(rs.getString(5));
                objdestino.setRegion(rs.getString(6));
                objdestino.setIdproveedor(rs.getInt(7));
                objdestino.setRazon_social(rs.getString(8));
                objdestino.setCosto(rs.getDouble(9));
                objdestino.setPrecio(rs.getDouble(10));
                objdestino.setFecha(LocalDate.parse(rs.getString(11)));
                lista.add(objdestino);
            }
            pt.close();
            rs.close();
            cn.close();
        } catch (SQLException e) {
            mensaje = e.getMessage();
        }
        return lista;
    }

    public Destino buscarDestinoxId(int iddestino) {
        try {
            cn = conexionBD.getConexionBD();
            pt = cn.prepareStatement("SELECT des.iddestino, des.destino, d.departamento,des.region, des.provincia, p.razon_social, des.fecha, des.precio, p.costo FROM destino des inner join departamento d on(des.iddepartamento=d.iddepartamento) inner join proveedor p on(des.idproveedor=p.idproveedor) where des.iddestino=" + iddestino + " ");
            rs = pt.executeQuery();

            while (rs.next()) {
                objdestino = new Destino();
                objdestino.setIddestino(rs.getInt(1));
                objdestino.setDestino(rs.getString(2));
                objdestino.setDepartamento(rs.getString(3));
                objdestino.setRegion(rs.getString(4));
                objdestino.setProvincia(rs.getString(5));
                objdestino.setRazon_social(rs.getString(6));
                objdestino.setFecha(LocalDate.parse(rs.getString(7)));
                objdestino.setPrecio(rs.getDouble(8));
                objdestino.setCosto(rs.getDouble(9));

            }
            pt.close();
            rs.close();
            cn.close();

        } catch (SQLException e) {
            mensaje = e.getMessage();
        }
        return objdestino;
    }

    public int insertarDestino(Destino objdestino) {
        int estado = 0;
        try {
            cn = conexionBD.getConexionBD();
            pt = cn.prepareStatement("INSERT INTO destino(iddestino,idproveedor,fecha,iddepartamento,destino,region,provincia,precio) VALUES(?,?,?,?,?,?,?,?);");
            pt.setInt(1, contador);
            pt.setInt(2, objdestino.getIdproveedor());
            pt.setString(3, objdestino.getFecha().toString());
            pt.setInt(4, objdestino.getIddepartamento());
            pt.setString(5, objdestino.getDestino());
            pt.setString(6, objdestino.getRegion());
            pt.setString(7, objdestino.getProvincia());
            pt.setDouble(8, objdestino.getPrecio());
            estado = pt.executeUpdate();
            pt.close();
            cn.close();
        } catch (SQLException e) {
            mensaje = e.getMessage();
        }
        contador++;
        return estado;
    }

    public int modificarDestino(Destino objdestino) {
        int estado = 0;
        try {
            cn = conexionBD.getConexionBD();
            pt = cn.prepareStatement("update destino set idproveedor=?, fecha=?, iddepartamento=?, destino=?, region=?, provincia=?, precio=? WHERE iddestino='" + objdestino.getIddestino() + "';");

            pt.setInt(1, objdestino.getIdproveedor());
            pt.setString(2, objdestino.getFecha().toString());
            pt.setInt(3, objdestino.getIddepartamento());
            pt.setString(4, objdestino.getDestino());
            pt.setString(5, objdestino.getRegion());
            pt.setString(6, objdestino.getProvincia());
            pt.setDouble(7, objdestino.getPrecio());
            estado = pt.executeUpdate();
            pt.close();
            cn.close();
        } catch (SQLException e) {
            mensaje = e.getMessage();
        }
        return estado;
    }

    public int eliminarDestino(int iddestino) {
        int estado = 0;
        try {
            cn = conexionBD.getConexionBD();
            pt = cn.prepareStatement("DELETE FROM destino WHERE iddestino='" + iddestino + "' ");
            estado = pt.executeUpdate();
            pt.close();
            cn.close();
        } catch (SQLException e) {
            mensaje = e.getMessage();
        }
        return estado;
    }

    public ArrayList<Destino> buscardestinoxIddepartamento(int iddepartamento) {
        try {
            cn = conexionBD.getConexionBD();
            if (iddepartamento != 0) {
                pt = cn.prepareStatement("SELECT * FROM destino inner join departamento using(iddepartamento) where iddepartamento = '" + iddepartamento + "'");
            } else if (iddepartamento == 0) {
                pt = cn.prepareStatement("SELECT * FROM destino inner join departamento using(iddepartamento)");
            }
            rs = pt.executeQuery();
            lista = new ArrayList<>();
            while (rs.next()) {
                objdestino = new Destino();
                objdestino.setIddestino(rs.getInt(2));
                objdestino.setDestino(rs.getString(3));
                objdestino.setDepartamento(rs.getString(4));
                objdestino.setProvincia(rs.getString(5));
                objdestino.setRegion(rs.getString(6));
                objdestino.setRazon_social(rs.getString(7));
                objdestino.setCosto(rs.getDouble(8));
                objdestino.setPrecio(rs.getDouble(9));
                objdestino.setFecha(LocalDate.parse(rs.getString(10)));
                lista.add(objdestino);
            }
            pt.close();
            rs.close();
            cn.close();

        } catch (SQLException e) {
            mensaje = e.getMessage();
        }
        return lista;
    }

}
