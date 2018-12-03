/*
 Proyecto Java EE, DAGSS-2014
 */
package es.uvigo.esei.dagss.dominio.daos;

import es.uvigo.esei.dagss.dominio.entidades.Paciente;
import es.uvigo.esei.dagss.dominio.entidades.Prescripcion;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import javax.ejb.LocalBean;
import javax.ejb.Stateless;
import javax.persistence.TypedQuery;

@Stateless
@LocalBean
public class PacienteDAO extends GenericoDAO<Paciente> {

    public Paciente buscarPorDNI(String dni) {
        TypedQuery<Paciente> q = em.createQuery("SELECT p FROM Paciente AS p "
                                              + "  WHERE p.dni = :dni", Paciente.class);
        q.setParameter("dni", dni);
        return filtrarResultadoUnico(q);
    }

    public Paciente buscarPorTarjetaSanitaria(String tarjetaSanitaria) {
        TypedQuery<Paciente> q = em.createQuery("SELECT p FROM Paciente AS p "
                                              + "  WHERE p.numeroTarjetaSanitaria = :tarjetaSanitaria", Paciente.class);
        q.setParameter("tarjetaSanitaria", tarjetaSanitaria);

        return filtrarResultadoUnico(q);
    }

    public Paciente buscarPorNumeroSeguridadSocial(String numeroSeguridadSocial) {
        TypedQuery<Paciente> q = em.createQuery("SELECT p FROM Paciente AS p "
                                              + "  WHERE p.numeroSeguridadSocial = :numeroSeguridadSocial", Paciente.class);
        q.setParameter("numeroSeguridadSocial", numeroSeguridadSocial);

        return filtrarResultadoUnico(q);
    }


    public List<Paciente> buscarPorNombre(String patron) {
        TypedQuery<Paciente> q = em.createQuery("SELECT p FROM Paciente AS p "
                                              + "  WHERE (p.nombre LIKE :patron) OR "
                                              + "        (p.apellidos LIKE :patron)", Paciente.class);
        q.setParameter("patron","%"+patron+"%");        
        return q.getResultList();
    }

    public List<Paciente> buscarPorLocalidad(String localidad) {
        TypedQuery<Paciente> q = em.createQuery("SELECT p FROM Paciente AS p "
                                              + "  WHERE p.direccion.localidad LIKE :patron", Paciente.class);
        q.setParameter("patron","%"+localidad+"%");        
        return q.getResultList();
    }

    // Completar aqui
    public List<Prescripcion> buscarPrescripciones(Paciente paciente){
        TypedQuery<Prescripcion> q = em.createQuery("SELECT p FROM Prescripcion AS p "
                                              + "  WHERE p.id = :paciente_id", Prescripcion.class);
        q.setParameter("paciente_id", paciente.getId());        
        return q.getResultList();
    }

    // Completar aqui
    public List<Prescripcion> buscarPrescripcionesVigentes(Paciente paciente){
        TypedQuery<Prescripcion> q = em.createQuery("SELECT p FROM Prescripcion AS p "
                                              + "  WHERE p.paciente.id = :paciente_id AND p.fechaFin > :ahora", Prescripcion.class);
        q.setParameter("paciente_id", paciente.getId());
        q.setParameter("ahora", new java.sql.Date(new Date().getTime()));
        System.out.println("Prescripcion: " + q.toString() + " ---- " + paciente.getId() + " -> " + new java.sql.Date(new Date().getTime()));
        System.out.println( q.getResultList().toString());
        return q.getResultList();
    }
}
