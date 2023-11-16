package Modelo;

import java.time.LocalDate;

public class Destino {

    int iddestino;
    int idproveedor;
    String razon_social;
    double costo;
    LocalDate fecha;
    int iddepartamento;
    String departamento;
    String destino;
    String region;
    String provincia;
    double precio;

   public Destino(){
       
   }

    public Destino(int iddestino, int idproveedor, LocalDate fecha, int iddepartamento, String destino, String region, String provincia, double precio) {
        this.iddestino = iddestino;
        this.idproveedor = idproveedor;
        this.fecha = fecha;
        this.iddepartamento = iddepartamento;
        this.destino = destino;
        this.region = region;
        this.provincia = provincia;
        this.precio = precio;
    }


    public Destino(int idproveedor, LocalDate fecha, int iddepartamento, String destino, String region, String provincia, double precio) {
        this.idproveedor = idproveedor;
        this.fecha = fecha;
        this.iddepartamento = iddepartamento;
        this.destino = destino;
        this.region = region;
        this.provincia = provincia;
        this.precio = precio;
    }

   
    public int getIddestino() {
        return iddestino;
    }

    public void setIddestino(int iddestino) {
        this.iddestino = iddestino;
    }

    public int getIdproveedor() {
        return idproveedor;
    }

    public void setIdproveedor(int idproveedor) {
        this.idproveedor = idproveedor;
    }

    public String getRazon_social() {
        return razon_social;
    }

    public void setRazon_social(String razon_social) {
        this.razon_social = razon_social;
    }

    public double getCosto() {
        return costo;
    }

    public void setCosto(double costo) {
        this.costo = costo;
    }

    public LocalDate getFecha() {
        return fecha;
    }

    public void setFecha(LocalDate fecha) {
        this.fecha = fecha;
    }

    public int getIddepartamento() {
        return iddepartamento;
    }

    public void setIddepartamento(int iddepartamento) {
        this.iddepartamento = iddepartamento;
    }

    public String getDepartamento() {
        return departamento;
    }

    public void setDepartamento(String departamento) {
        this.departamento = departamento;
    }

    public String getDestino() {
        return destino;
    }

    public void setDestino(String destino) {
        this.destino = destino;
    }

    public String getRegion() {
        return region;
    }

    public void setRegion(String region) {
        this.region = region;
    }

    public String getProvincia() {
        return provincia;
    }

    public void setProvincia(String provincia) {
        this.provincia = provincia;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    

}
