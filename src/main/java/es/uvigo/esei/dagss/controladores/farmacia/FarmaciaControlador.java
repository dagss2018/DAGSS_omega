/*
 Proyecto Java EE, DAGSS-2013
 */
package es.uvigo.esei.dagss.controladores.farmacia;

import es.uvigo.esei.dagss.controladores.autenticacion.AutenticacionControlador;
import es.uvigo.esei.dagss.dominio.daos.FarmaciaDAO;
import es.uvigo.esei.dagss.dominio.daos.RecetaDAO;
import es.uvigo.esei.dagss.dominio.entidades.EstadoReceta;
import es.uvigo.esei.dagss.dominio.entidades.Farmacia;
import es.uvigo.esei.dagss.dominio.entidades.Receta;
import es.uvigo.esei.dagss.dominio.entidades.TipoUsuario;
import javax.inject.Named;
import javax.enterprise.context.SessionScoped;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.ejb.EJB;
import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import javax.inject.Inject;

/**
 *
 * @author ribadas
 */
@Named(value = "farmaciaControlador")
@SessionScoped
public class FarmaciaControlador implements Serializable {

    private Farmacia farmaciaActual;
    private String nif;
    private String password;
    
    private String numTarjetaPaciente;
    private List<Receta> listRecetasPacientes;
    
    @Inject
    private AutenticacionControlador autenticacionControlador;

    @EJB
    private FarmaciaDAO farmaciaDAO;

    @EJB
    private RecetaDAO recetaDAO;

    
    
    /**
     * Creates a new instance of AdministradorControlador
     */
    public FarmaciaControlador() {
    }

    public String getNif() {
        return nif;
    }

    public void setNif(String nif) {
        this.nif = nif;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Farmacia getFarmaciaActual() {
        return farmaciaActual;
    }

    public void setFarmaciaActual(Farmacia farmaciaActual) {
        this.farmaciaActual = farmaciaActual;
    }

    private boolean parametrosAccesoInvalidos() {
        return ((nif == null) || (password == null));
    }

    public String doLogin() {
        String destino = null;
        if (parametrosAccesoInvalidos()) {
            FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_WARN, "No se ha indicado un nif o una contraseña", ""));
        } else {
            Farmacia farmacia = farmaciaDAO.buscarPorNIF(nif);
            if (farmacia == null) {
                FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_WARN, "No existe una farmacia con el NIF " + nif, ""));
            } else {
                if (autenticacionControlador.autenticarUsuario(farmacia.getId(), password,
                        TipoUsuario.FARMACIA.getEtiqueta().toLowerCase())) {
                    farmaciaActual = farmacia;
                    destino = "privado/index";
                } else {
                    FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_WARN, "Credenciales de acceso incorrectas", ""));
                }

            }
        }
        return destino;
    }

    public String getNumTarjetaPaciente() {
        return numTarjetaPaciente;
    }

    public void setNumTarjetaPaciente(String numTarjetaPaciente) {
        this.numTarjetaPaciente = numTarjetaPaciente;
    }

    public List<Receta> getListRecetasPacientes() {
        return listRecetasPacientes;
    }

    public void setListRecetasPacientes(List<Receta> listRecetasPacientes) {
        this.listRecetasPacientes = listRecetasPacientes;
    }
    

    public String doBuscarRecetasUsuario(){

        listRecetasPacientes =
                    farmaciaDAO.buscarRecetasPorPaciente(numTarjetaPaciente);

        return "recetas/listadoRecetas";
    }
    
    
    public boolean isRecetaValida(Receta receta){
        Date today = new Date();
        return receta.getInicioValidez().before(today) && receta.getFinValidez().after(today);
    }
    
    
    public boolean isRecetaGenerada(Receta receta){
        return receta.getEstado().equals(EstadoReceta.GENERADA);
    }
    
    public List<EstadoReceta> getListaEstados(){
        List<EstadoReceta> listaEstadoReceta = new ArrayList<>();
        listaEstadoReceta.add(EstadoReceta.GENERADA);
        listaEstadoReceta.add(EstadoReceta.SERVIDA);
        listaEstadoReceta.add(EstadoReceta.ANULADA);
        
        return listaEstadoReceta;
    }
    
    public void onEstadoSeleccionado(Receta recetaConEstado){
        recetaConEstado.setFarmaciaDispensadora(this.farmaciaActual);
        recetaDAO.actualizar(recetaConEstado);
    }
    
}
