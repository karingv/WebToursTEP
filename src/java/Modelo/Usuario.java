package Modelo;

import java.time.LocalDate;

public class Usuario {

    int idcliente;
    String nombres;
    String apellidos;
    String dni;
    int numerovacunas;
    LocalDate fecha_nac;
    String celular;
    String correo;
    String usuario;
    String contraseña;
    int id_rol;

    
public Usuario(){

}

    public Usuario(int idcliente, String nombres, String apellidos, String dni, int numerovacunas, LocalDate fecha_nac, String celular, String correo, String usuario, String contraseña, int id_rol) {
        this.idcliente = idcliente;
        this.nombres = nombres;
        this.apellidos = apellidos;
        this.dni = dni;
        this.numerovacunas = numerovacunas;
        this.fecha_nac = fecha_nac;
        this.celular = celular;
        this.correo = correo;
        this.usuario = usuario;
        this.contraseña = contraseña;
        this.id_rol = id_rol;
    }
    
    public Usuario(String nombres, String apellidos, String dni, int numerovacunas, LocalDate fecha_nac, String celular, String correo, String usuario, String contraseña, int id_rol) {
        this.nombres = nombres;
        this.apellidos = apellidos;
        this.dni = dni;
        this.numerovacunas = numerovacunas;
        this.fecha_nac = fecha_nac;
        this.celular = celular;
        this.correo = correo;
        this.usuario = usuario;
        this.contraseña = contraseña;
        this.id_rol = id_rol;
    }




    public int getIdcliente() {
        return idcliente;
    }

    public void setIdcliente(int idcliente) {
        this.idcliente = idcliente;
    }

    public String getNombres() {
        return nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public String getDni() {
        return dni;
    }

    public void setDni(String dni) {
        this.dni = dni;
    }

    public int getNumerovacunas() {
        return numerovacunas;
    }

    public void setNumerovacunas(int numerovacunas) {
        this.numerovacunas = numerovacunas;
    }

    public LocalDate getFecha_nac() {
        return fecha_nac;
    }

    public void setFecha_nac(LocalDate fecha_nac) {
        this.fecha_nac = fecha_nac;
    }

    public String getCelular() {
        return celular;
    }

    public void setCelular(String celular) {
        this.celular = celular;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getContraseña() {
        return contraseña;
    }

    public void setContraseña(String contraseña) {
        this.contraseña = contraseña;
    }

    public int getId_rol() {
        return id_rol;
    }

    public void setId_rol(int id_rol) {
        this.id_rol = id_rol;
    }



}
