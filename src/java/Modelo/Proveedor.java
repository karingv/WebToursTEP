package Modelo;

public class Proveedor {

    int idproveedor;
    String ruc;
    String razon_social;
    String correo;
    String telefono;
    double costo;

    public Proveedor() {

    }

    public Proveedor(int idproveedor, String ruc, String razon_social, String correo, String telefono, double costo) {
        this.idproveedor = idproveedor;
        this.ruc = ruc;
        this.razon_social = razon_social;
        this.correo = correo;
        this.telefono = telefono;
        this.costo = costo;
    }
    

    public Proveedor(String ruc, String razon_social, String correo, String telefono, double costo) {
        this.ruc = ruc;
        this.razon_social = razon_social;
        this.correo = correo;
        this.telefono = telefono;
        this.costo = costo;
    }
    

    public int getIdproveedor() {
        return idproveedor;
    }

    public void setIdproveedor(int idproveedor) {
        this.idproveedor = idproveedor;
    }

    public String getRuc() {
        return ruc;
    }

    public void setRuc(String ruc) {
        this.ruc = ruc;
    }

    public String getRazon_social() {
        return razon_social;
    }

    public void setRazon_social(String razon_social) {
        this.razon_social = razon_social;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public double getCosto() {
        return costo;
    }

    public void setCosto(double costo) {
        this.costo = costo;
    }

}
