package es.uvigo.esei.dagss.controladores.farmacia;

import es.uvigo.esei.dagss.dominio.entidades.Receta;
import es.uvigo.esei.dagss.dominio.daos.RecetaDAO;
import es.uvigo.esei.dagss.dominio.entidades.Cita;
import java.io.Serializable;
import java.util.List;
import javax.enterprise.context.SessionScoped;
import javax.inject.Inject;
import javax.inject.Named;
import javax.annotation.PostConstruct;

@Named(value = "gestionRecetasControlador")
@SessionScoped
public class GestionRecetasControlador implements Serializable{
    
    @Inject
    RecetaDAO recetaDAO;
    
    List<Receta> recetas;
    Receta recetaActual;
    
    public GestionRecetasControlador(){
        
    }
    
    @PostConstruct
    public void inicializar() {
        recetas = recetaDAO.buscarTodos();
    }   
    
     public List<Receta> getRecetas() {
        return recetas;
     }

    public void setRecetas(List<Receta> recetas) {
        this.recetas = recetas;
    }

    public Receta getRecetaActual() {
        return recetaActual;
    }

    
}
