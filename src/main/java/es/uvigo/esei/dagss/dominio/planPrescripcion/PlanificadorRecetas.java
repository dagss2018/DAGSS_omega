/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package es.uvigo.esei.dagss.dominio.planPrescripcion;

import es.uvigo.esei.dagss.dominio.entidades.Prescripcion;
import es.uvigo.esei.dagss.dominio.entidades.Receta;
import java.util.List;

/**
 *
 * @author Miguel
 */
public interface PlanificadorRecetas {
    
    List<Receta> planificarPrescripcion(Prescripcion prescripcion);
}
