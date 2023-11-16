package Modelo;

import Util.conexionBD;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;

public class ModeloReserva {

    Connection cn = null;
    PreparedStatement pt = null;
    ResultSet rs = null;
    ArrayList<Reserva> lista = null;
    Reserva objreserva = null;
    int contador = 0;
    String mensaje;

    public ArrayList<Reserva> listarReservas() {
        try {
            cn = conexionBD.getConexionBD();
            pt = cn.prepareStatement("select r.idreserva,r.idcliente, u.nombres, u.apellidos, d.destino, de.departamento, p.razon_social, d.fecha, r.estado, r.cantidad, r.cantidad*(p.costo + d.precio) as preciototal from reserva r inner join usuario u on (u.idcliente=r.idcliente) inner join destino d on (d.iddestino=r.iddestino) inner join departamento de on(de.iddepartamento=d.iddepartamento) inner join proveedor p on(p.idproveedor=d.iddestino);");
            rs = pt.executeQuery();
            lista = new ArrayList<>();
            while (rs.next()) {
                objreserva = new Reserva();
                objreserva.setIdreserva(rs.getInt(1));
                objreserva.setIdcliente(rs.getInt(2));
                objreserva.setNombres(rs.getString(3));
                objreserva.setApellidos(rs.getString(4));
                objreserva.setDestino(rs.getString(5));
                objreserva.setDepartamento(rs.getString(6));
                objreserva.setRazon_social(rs.getString(7));
                objreserva.setFecha(LocalDate.parse(rs.getString(8)));
                objreserva.setEstado(rs.getString(9));
                objreserva.setCantidad(rs.getInt(10));
                objreserva.setPreciototal(rs.getDouble(11));
                lista.add(objreserva);
            }
            pt.close();
            rs.close();
            cn.close();
        } catch (SQLException e) {
            mensaje = e.getMessage();
        }
        return lista;
    }

    public ArrayList<Reserva> listarTodasLasReservas() {
        try {
            cn = conexionBD.getConexionBD();
            pt = cn.prepareStatement("select r.idreserva,u.idcliente,u.nombres,u.apellidos ,d.destino,de.departamento,p.razon_social,d.fecha,r.estado,r.cantidad,(d.precio+p.costo)* r.cantidad as preciototal "
                    + "from reserva r "
                    + "inner join destino d on (r.iddestino=d.iddestino) "
                    + "inner join departamento de on (d.iddepartamento=de.iddepartamento) "
                    + "inner join proveedor p on (d.idproveedor=p.idproveedor) "
                    + "inner join usuario u using (idcliente) ORDER by d.fecha asc;");
            rs = pt.executeQuery();
            lista = new ArrayList<>();
            while (rs.next()) {
                objreserva = new Reserva();
                objreserva.setIdreserva(rs.getInt(1));
                objreserva.setIdcliente(rs.getInt(2));
                objreserva.setNombres(rs.getString(3));
                objreserva.setApellidos(rs.getString(4));
                objreserva.setDestino(rs.getString(5));
                objreserva.setDepartamento(rs.getString(6));
                objreserva.setRazon_social(rs.getString(7));
                objreserva.setFecha(LocalDate.parse(rs.getString(8)));
                objreserva.setEstado(rs.getString(9));
                objreserva.setCantidad(rs.getInt(10));
                objreserva.setPreciototal(rs.getDouble(11));
                lista.add(objreserva);
            }
            pt.close();
            rs.close();
            cn.close();
        } catch (SQLException e) {
            mensaje = e.getMessage();
        }
        return lista;
    }

    public int insertarReservarDestino(Reserva objreserva) {
        int estado = 0;
        try {
            cn = conexionBD.getConexionBD();
            pt = cn.prepareStatement("INSERT INTO reserva(idreserva,idcliente,iddestino,estado,cantidad) VALUES(?,?,?,?,?)");
            pt.setInt(1, objreserva.getIdreserva());
            pt.setInt(2, objreserva.getIdcliente());
            pt.setInt(3, objreserva.getIddestino());
            pt.setString(4, objreserva.getEstado());
            pt.setInt(5, objreserva.getCantidad());
            estado = pt.executeUpdate();
            pt.close();
            cn.close();
        } catch (SQLException e) {
            mensaje = e.getMessage();
        }
        return estado;
    }

    public ArrayList<Reserva> listarReservasxDestino(int idcliente) {
        try {
            cn = conexionBD.getConexionBD();
            pt = cn.prepareStatement("select r.idreserva, r.idcliente, u.nombres, u.apellidos, u.celular, d.destino, de.departamento, d.fecha,r.cantidad, r.cantidad* (p.costo + d.precio) as preciototal,r.estado "
                    + "from reserva r "
                    + "inner join usuario u on(u.idcliente=r.idcliente) "
                    + "inner join destino d on(d.iddestino=r.iddestino) "
                    + "inner join departamento de on(de.iddepartamento=d.iddepartamento) "
                    + "inner join proveedor p on(p.idproveedor=d.idproveedor);");
            rs = pt.executeQuery();
            lista = new ArrayList<>();
            while (rs.next()) {
                objreserva = new Reserva();
                objreserva.setIdreserva(rs.getInt(1));
                objreserva.setIdcliente(rs.getInt(2));
                objreserva.setNombres(rs.getString(3));
                objreserva.setApellidos(rs.getString(4));
                objreserva.setCelular(rs.getString(5));
                objreserva.setDestino(rs.getString(6));
                objreserva.setDepartamento(rs.getString(7));
                objreserva.setFecha(LocalDate.parse(rs.getString(8)));
                objreserva.setCantidad(rs.getInt(9));
                objreserva.setPreciototal(rs.getDouble(10));
                objreserva.setEstado(rs.getString(11));
                lista.add(objreserva);
            }
            pt.close();
            rs.close();
            cn.close();
        } catch (SQLException e) {
            mensaje = e.getMessage();
        }
        return lista;
    }

    public ArrayList<Reserva> listarReservasxCliente(int idcliente) {
        try {
            cn = conexionBD.getConexionBD();
            pt = cn.prepareStatement("select r.idreserva, r.idcliente, u.nombres, u.apellidos, u.celular, d.destino, de.departamento, d.fecha,r.cantidad, r.cantidad* (p.costo + d.precio) as preciototal,r.estado "
                    + "from reserva r "
                    + "inner join usuario u on(u.idcliente=r.idcliente) "
                    + "inner join destino d on(d.iddestino=r.iddestino) "
                    + "inner join departamento de on(de.iddepartamento=d.iddepartamento) "
                    + "inner join proveedor p on(p.idproveedor=d.idproveedor) "
                    + "where r.idcliente='" + idcliente + "';");
            rs = pt.executeQuery();
            lista = new ArrayList<>();
            while (rs.next()) {
                objreserva = new Reserva();
                objreserva.setIdreserva(rs.getInt(1));
                objreserva.setIdcliente(rs.getInt(2));
                objreserva.setNombres(rs.getString(3));
                objreserva.setApellidos(rs.getString(4));
                objreserva.setCelular(rs.getString(5));
                objreserva.setDestino(rs.getString(6));
                objreserva.setDepartamento(rs.getString(7));
                objreserva.setFecha(LocalDate.parse(rs.getString(8)));
                objreserva.setCantidad(rs.getInt(9));
                objreserva.setPreciototal(rs.getDouble(10));
                objreserva.setEstado(rs.getString(11));
                lista.add(objreserva);
            }
            pt.close();
            rs.close();
            cn.close();
        } catch (SQLException e) {
            mensaje = e.getMessage();
        }
        return lista;
    }

    public int modificarReserva(Reserva objreserva) {
        int estado = 0;
        try {
            cn = conexionBD.getConexionBD();
            pt = cn.prepareStatement("update reserva set iddestino=?, cantidad=? where idreserva='" + objreserva.getIdreserva() + "'");

            pt.setInt(1, objreserva.getIddestino());
            pt.setInt(2, objreserva.getCantidad());
            estado = pt.executeUpdate();
            pt.close();
            cn.close();
        } catch (SQLException e) {
            mensaje = e.getMessage();
        }
        return estado;
    }

    public int eliminarReserva(int idreserva) {
        int estado = 0;
        try {
            cn = conexionBD.getConexionBD();
            pt = cn.prepareStatement("Delete from reserva where idreserva='" + idreserva + "'");
            estado = pt.executeUpdate();
            pt.close();
            cn.close();
        } catch (SQLException e) {
            mensaje = e.getMessage();
        }
        return estado;
    }

    public int estadoReserva(int idreserva, String Estado) {
        int estado = 0;
        try {
            cn = conexionBD.getConexionBD();
            pt = cn.prepareStatement("update reserva set estado=? where idreserva='" + idreserva + "' ");
            pt.setString(1, Estado);
            estado = pt.executeUpdate();
            pt.close();
            cn.close();
        } catch (SQLException e) {
            mensaje = e.getMessage();
        }
        return estado;

    }

}
