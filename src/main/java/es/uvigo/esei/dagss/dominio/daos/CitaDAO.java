/*
 Proyecto Java EE, DAGSS-2014
 */

package es.uvigo.esei.dagss.dominio.daos;

import es.uvigo.esei.dagss.dominio.entidades.Cita;
import es.uvigo.esei.dagss.dominio.entidades.Medico;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import javax.ejb.LocalBean;
import javax.ejb.Stateless;
import javax.persistence.TypedQuery;


@Stateless
@LocalBean
public class CitaDAO  extends GenericoDAO<Cita>{    

    public List<Cita> getCitasPara(Medico medico,Date fechaActual){
    TypedQuery<Cita> q = em.createQuery("SELECT c FROM Cita AS c "
                                              + "  WHERE c.fecha >= :fecha_actual AND c.fecha <= :fecha_manana AND c.medico.id = :idMedico ", Cita.class);
        Calendar fechaActualSinHoras = Calendar.getInstance();
        fechaActualSinHoras.setTime(fechaActual);
        fechaActualSinHoras.set(fechaActualSinHoras.get(Calendar.YEAR), fechaActualSinHoras.get(Calendar.MONTH), fechaActualSinHoras.get(Calendar.DAY_OF_MONTH), 0, 0, 0);
        //fechaActualSinHoras = Hoy 00:00:00
        q.setParameter("fecha_actual", new Date(fechaActualSinHoras.getTimeInMillis()));
        fechaActualSinHoras.add(Calendar.HOUR_OF_DAY, 24);
        //fechaActualSinHoras = Manana 00:00:00
        q.setParameter("fecha_manana", new Date(fechaActualSinHoras.getTimeInMillis()));
        q.setParameter("idMedico", medico.getId());
        return q.getResultList();
    }
}
