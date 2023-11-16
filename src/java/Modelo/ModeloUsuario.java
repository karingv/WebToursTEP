package Modelo;

import java.sql.*;
import Util.conexionBD;
import java.time.LocalDate;
import java.util.*;

public class ModeloUsuario {

    Connection cn = null;
    PreparedStatement pt = null;
    ResultSet rs = null;
    ArrayList<Usuario> lista = null;
    Usuario objusuario = null;
    int contador = 0;
    String mensaje;

    public boolean validarAcceso(Usuario usuario) {
        boolean estado = false;
        try {
            cn = conexionBD.getConexionBD();
            pt = cn.prepareStatement("SELECT * FROM usuario;");
            rs = pt.executeQuery();
            lista = new ArrayList<>();
            while (rs.next()) {
                objusuario = new Usuario();
                objusuario.setId_rol(rs.getInt(11));
                objusuario.setUsuario(rs.getString(9));
                objusuario.setContraseña(rs.getString(10));
                lista.add(objusuario);
            }
            pt.close();
            rs.close();
            cn.close();

        } catch (SQLException e) {
            mensaje = e.getMessage();
        }
        for (Usuario objeto : lista) {
            if (usuario.getId_rol() == objeto.getId_rol() && usuario.getUsuario().equals(objeto.getUsuario())
                    && usuario.getContraseña().equals(objeto.getContraseña())) {
                estado = true;
                break;
            }
        }
        return estado;
    }

    public int codigoUsuario(String usuario) {
        try {
            cn = conexionBD.getConexionBD();
            pt = cn.prepareStatement("SELECT * FROM usuario where usuario like '" + usuario + "' ;");
            rs = pt.executeQuery();
            while (rs.next()) {
                objusuario = new Usuario();
                objusuario.setIdcliente(rs.getInt(1));
            }
            pt.close();
            rs.close();
            cn.close();

        } catch (SQLException e) {
        }
        int codigo = objusuario.getIdcliente();
        return codigo;
    }

    public ArrayList<Usuario> listarUsuarios() {
        try {
            cn = conexionBD.getConexionBD();
            pt = cn.prepareStatement("SELECT * FROM usuario;");
            rs = pt.executeQuery();
            lista = new ArrayList<>();
            while (rs.next()) {
                objusuario = new Usuario();
                objusuario.setIdcliente(rs.getInt(1));
                objusuario.setNombres(rs.getString(2));
                objusuario.setApellidos(rs.getString(3));
                objusuario.setDni(rs.getString(4));
                objusuario.setNumerovacunas(rs.getInt(5));
                objusuario.setFecha_nac(LocalDate.parse(rs.getString(6)));
                objusuario.setCelular(rs.getString(7));
                objusuario.setCorreo(rs.getString(8));
                objusuario.setUsuario(rs.getString(9));
                objusuario.setContraseña(rs.getString(10));
                objusuario.setId_rol(rs.getInt(11));
                lista.add(objusuario);
            }
            pt.close();
            rs.close();
            cn.close();
        } catch (SQLException e) {
            mensaje = e.getMessage();
        }
        return lista;
    }

    public int insertarUsuario(Usuario objusuario) {
        int estado = 0;
        try {

            cn = conexionBD.getConexionBD();
            pt = cn.prepareStatement("INSERT INTO usuario(idcliente,nombres,apellidos,dni,numerovacunas,fecha_nac,celular,correo,usuario,contraseña,id_rol) VALUES(?,?,?,?,?,?,?,?,?,?,?);");

            pt.setInt(1, contador);
            pt.setString(2, objusuario.getNombres());
            pt.setString(3, objusuario.getApellidos());
            pt.setString(4, objusuario.getDni());
            pt.setInt(5, objusuario.getNumerovacunas());
            pt.setString(6, objusuario.getFecha_nac().toString());
            pt.setString(7, objusuario.getCelular());
            pt.setString(8, objusuario.getCorreo());
            pt.setString(9, objusuario.getUsuario());
            pt.setString(10, objusuario.getContraseña());
            pt.setInt(11, objusuario.getId_rol());
            estado = pt.executeUpdate();
            pt.close();
            cn.close();

        } catch (SQLException e) {
            mensaje = e.getMessage();
        }
        contador++;
        return estado;
    }

    public int eliminarUsuario(Usuario objusuario) {
        int estado = 0;
        try {
            cn = conexionBD.getConexionBD();
            pt = cn.prepareStatement("DELETE FROM usuario WHERE idcliente=?;");
            pt.setInt(1, objusuario.getIdcliente());
            estado = pt.executeUpdate();
            pt.close();
            cn.close();

        } catch (SQLException e) {
            mensaje = e.getMessage();
        }
        return estado;
    }

    public int modificarUsuario(Usuario objusuario) {
        int estado = 0;
        try {
            cn = conexionBD.getConexionBD();
            pt = cn.prepareStatement("UPDATE usuario SET nombres=?,apellidos=?,dni=?,numerovacunas=?,fecha_nac=?,celular=?,correo=?,usuario=?,contraseña=?,id_rol=? WHERE idcliente= '" + objusuario.getIdcliente() + "';");
            pt.setString(1, objusuario.getNombres());
            pt.setString(2, objusuario.getApellidos());
            pt.setString(3, objusuario.getDni());
            pt.setInt(4, objusuario.getNumerovacunas());
            pt.setString(5, objusuario.getFecha_nac().toString());
            pt.setString(6, objusuario.getCelular());
            pt.setString(7, objusuario.getCorreo());
            pt.setString(8, objusuario.getUsuario());
            pt.setString(9, objusuario.getContraseña());
            pt.setInt(10, objusuario.getId_rol());
            estado = pt.executeUpdate();
            pt.close();
            cn.close();

        } catch (SQLException e) {
            mensaje = e.getMessage();
        }
        return estado;
    }

    public Usuario buscarUsuarioxId(int idcliente) {
        try {
            cn = conexionBD.getConexionBD();
            pt = cn.prepareStatement("SELECT * FROM usuario where idcliente = '" + idcliente + "'");
            rs = pt.executeQuery();
            while (rs.next()) {
                objusuario = new Usuario();
                objusuario.setIdcliente(rs.getInt(1));
                objusuario.setNombres(rs.getString(2));
                objusuario.setApellidos(rs.getString(3));
                objusuario.setDni(rs.getString(4));
                objusuario.setNumerovacunas(rs.getInt(5));
                objusuario.setFecha_nac(LocalDate.parse(rs.getString(6)));
                objusuario.setCelular(rs.getString(7));
                objusuario.setCorreo(rs.getString(8));
                objusuario.setUsuario(rs.getString(9));
                objusuario.setContraseña(rs.getString(10));
                objusuario.setId_rol(rs.getInt(11));
            }
            pt.close();
            rs.close();
            cn.close();
        } catch (SQLException e) {
            mensaje = e.getMessage();
        }
        return objusuario;
    }

}
