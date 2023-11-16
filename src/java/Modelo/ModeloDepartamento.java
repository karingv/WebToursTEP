
package Modelo;

import Util.conexionBD;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ModeloDepartamento {
    Connection cn = null;
    PreparedStatement pt = null;
    ResultSet rs = null;
    ArrayList<Departamento> lista = null;
    Departamento objdepartamento = null;
    String mensaje;

    public ArrayList<Departamento> listarDepartamento() {
        try {
            cn = conexionBD.getConexionBD();
            pt = cn.prepareStatement("select * from departamento");
            rs = pt.executeQuery();
            lista = new ArrayList<>();

            while (rs.next()) {
                objdepartamento = new Departamento();
                objdepartamento.setIddepartamento(rs.getInt(1));
                objdepartamento.setDepartamento(rs.getString(2));
                lista.add(objdepartamento);
            }
            pt.close();
            rs.close();
            cn.close();
        } catch (SQLException e) {
            mensaje = e.getMessage();
        }
        return lista;
    }
    
    public Departamento buscarDepartamentoxId(int iddepartamento){
        try {
            cn = conexionBD.getConexionBD();
            pt = cn.prepareStatement("select * from departamento where iddepartamento="+iddepartamento+" ");
            rs = pt.executeQuery();
            
            while (rs.next()) {
                objdepartamento = new Departamento();
                objdepartamento.setIddepartamento(rs.getInt(1));
                objdepartamento.setDepartamento(rs.getString(2));            
            }
            pt.close();
            rs.close();
            cn.close();
            
        } catch (SQLException e) {
            mensaje = e.getMessage();
        }
        return objdepartamento;
    }
    
}
