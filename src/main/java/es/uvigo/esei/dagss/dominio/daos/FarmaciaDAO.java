/*
 Proyecto Java EE, DAGSS-2016
 */
package es.uvigo.esei.dagss.dominio.daos;

import es.uvigo.esei.dagss.dominio.entidades.Farmacia;
import es.uvigo.esei.dagss.dominio.entidades.Receta;
import java.util.List;
import javax.ejb.LocalBean;
import javax.ejb.Stateless;
import javax.persistence.TypedQuery;

@Stateless
@LocalBean
public class FarmaciaDAO extends GenericoDAO<Farmacia> {

    public Farmacia buscarPorNIF(String nif) {
        TypedQuery<Farmacia> q = em.createQuery("SELECT f FROM Farmacia AS f "
                                              + "  WHERE f.nif = :nif", Farmacia.class);
        q.setParameter("nif", nif);

        return filtrarResultadoUnico(q);
    }

    // Completar aqui
    //Añadir recetas  existentes en el sistema desde la fecha actual
    public List<Receta> buscarRecetasPorPaciente(String numeroTarjetaPaciente){

        return em.createQuery( "SELECT r FROM Receta as r "
                                    + "WHERE r.prescripcion.paciente.numeroTarjetaSanitaria = :numeroTarjetaPaciente", Receta.class)
                .setParameter("numeroTarjetaPaciente",numeroTarjetaPaciente)
                .getResultList();
    }
}
