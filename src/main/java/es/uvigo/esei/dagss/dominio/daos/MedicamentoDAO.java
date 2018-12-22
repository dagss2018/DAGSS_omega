/*
 Proyecto Java EE, DAGSS-2014
 */
package es.uvigo.esei.dagss.dominio.daos;

import es.uvigo.esei.dagss.dominio.entidades.Medicamento;
import es.uvigo.esei.dagss.dominio.entidades.Prescripcion;
import java.util.List;
import javax.ejb.LocalBean;
import javax.ejb.Stateless;
import javax.persistence.TypedQuery;

@Stateless
@LocalBean
public class MedicamentoDAO extends GenericoDAO<Medicamento> {
        // Completar aqui
    public List<Medicamento> buscar( String nombreMedicamento, String nombreFabricante, 
                                String nombreFamilia, String principioActivo){
        TypedQuery<Medicamento> q = em.createQuery("SELECT m FROM Medicamento AS m "
                + "WHERE m.nombre LIKE :nombre AND m.fabricante LIKE :fabricante AND m.principioActivo LIKE :principioActivo"
                + " AND m.familia LIKE :familia", Medicamento.class);
        
        q.setParameter("nombre", "%" + nombreMedicamento + "%");
        q.setParameter("fabricante", "%" + nombreFabricante + "%");
        q.setParameter("familia", "%" + nombreFamilia + "%");
        q.setParameter("principioActivo", "%" + principioActivo + "%");
        
        return q.getResultList();
    }
    
    public List<Medicamento> buscarPrincipiosActivos(String nombre){
        TypedQuery<Medicamento> q = em.createQuery("SELECT m FROM Medicamento AS m "
                + "WHERE m.principioActivo LIKE :principioActivo", Medicamento.class);
        
        q.setParameter("principioActivo", "%" + nombre + "%");
        
        return q.getResultList();
    }
    
    public List<Medicamento> buscarNombresMedicamentos(String nombre){
        TypedQuery<Medicamento> q = em.createQuery("SELECT m FROM Medicamento AS m "
                + "WHERE m.nombre LIKE :nombre", Medicamento.class);
        
        q.setParameter("nombre", "%" + nombre + "%");
        
        return q.getResultList();
    }
    
    public List<Medicamento> buscarFamilias(String nombre){
        TypedQuery<Medicamento> q = em.createQuery("SELECT m FROM Medicamento AS m "
                + "WHERE m.familia LIKE :familia", Medicamento.class);
        
        q.setParameter("familia", "%" + nombre + "%");
        
        return q.getResultList();
    }
    
    public List<Medicamento> buscarFabricantes(String nombre){
        TypedQuery<Medicamento> q = em.createQuery("SELECT m FROM Medicamento AS m WHERE m.fabricante LIKE :fabricante", Medicamento.class);
        
        q.setParameter("fabricante", "%" + nombre + "%");
        
        return q.getResultList();
    }
}
