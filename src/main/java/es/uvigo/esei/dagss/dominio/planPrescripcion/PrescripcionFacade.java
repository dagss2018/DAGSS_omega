/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package es.uvigo.esei.dagss.dominio.planPrescripcion;

import es.uvigo.esei.dagss.dominio.daos.PrescripcionDAO;
import es.uvigo.esei.dagss.dominio.daos.RecetaDAO;
import es.uvigo.esei.dagss.dominio.entidades.Prescripcion;
import es.uvigo.esei.dagss.dominio.entidades.Receta;
import java.util.List;
import javax.annotation.PostConstruct;


import javax.ejb.Stateless;
import javax.inject.Inject;

/**
 *
 * @author Miguel
 */
@Stateless
public class PrescripcionFacade {
    
    private PlanificadorRecetas planificadorRecetas;
    
    @Inject
    private RecetaDAO recetaDAO;
    
    
    @Inject
    private PrescripcionDAO prescripcionDAO;
    
    @PostConstruct
    public void crearPlanificador(){
        planificadorRecetas = new PlanificadorRecetasSemanal();
    }
    
    public void planificar(Prescripcion prescripcion){
        
       prescripcionDAO.crear(prescripcion);

        List<Receta> listaRecetas = planificadorRecetas.planificarPrescripcion(prescripcion);
        for(Receta r: listaRecetas){
            recetaDAO.crear(r);
        }
    }

    public void eliminar(Prescripcion p) {
       prescripcionDAO.eliminar(p);
    }
}
