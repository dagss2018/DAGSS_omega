/*
 Proyecto Java EE, DAGSS-2014
 */

package es.uvigo.esei.dagss.dominio.daos;

import es.uvigo.esei.dagss.dominio.entidades.Cita;
import java.sql.Date;
import java.util.List;
import javax.ejb.LocalBean;
import javax.ejb.Stateless;
import javax.persistence.TypedQuery;


@Stateless
@LocalBean
public class CitaDAO  extends GenericoDAO<Cita>{    

    public List<Cita> getCitasPara(Date dia){
        TypedQuery<Cita> q = em.createQuery("SELECT c FROM Cita AS c "
                                              + "  WHERE c.fecha = :dia", Cita.class);
        q.setParameter("dia", dia);
        return q.getResultList();
    }
}
