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
                + "WHERE m.nombre = :nombre AND m.fabricante = :fabricante AND m.principioActivo = :principioActivo"
                + " AND m.familia = :familia", Medicamento.class);
        
        q.setParameter("nombre", "%" + nombreMedicamento + "%");
        q.setParameter("fabricante", "%" + nombreFabricante + "%");
        q.setParameter("familia", "%" + nombreFamilia + "%");
        q.setParameter("principioActivo", "%" + principioActivo + "%");
        
        return q.getResultList();
    }
    
    public List<String> buscarPrincipiosActivos(String nombre){
        TypedQuery<String> q = em.createQuery("SELECT m.principioActivo FROM Medicamento AS m "
                + "WHERE m.principioActivo = :principioActivo", String.class);
        
        q.setParameter("principioActivo", "%" + nombre + "%");
        
        return q.getResultList();
    }
    
    public List<String> buscarNombresMedicamentos(String nombre){
        TypedQuery<String> q = em.createQuery("SELECT m.nombre FROM Medicamento AS m "
                + "WHERE m.nombre = :nombre", String.class);
        
        q.setParameter("nombre", "%" + nombre + "%");
        
        return q.getResultList();
    }
    
    public List<String> buscarFamilias(String nombre){
        TypedQuery<String> q = em.createQuery("SELECT m.familia FROM Medicamento AS m "
                + "WHERE m.familia = :familia", String.class);
        
        q.setParameter("familia", "%" + nombre + "%");
        
        return q.getResultList();
    }
    
    public List<Medicamento> buscarFabricantes(String nombre){
        TypedQuery<Medicamento> q = em.createQuery("SELECT m FROM Medicamento AS m ", Medicamento.class);
//                + "WHERE m.fabricante LIKE :fabricante", Medicamento.class);
        
//        q.setParameter("fabricante", "%" + nombre + "%");
        
//        System.out.println("Fabricante: " + ", " + ", " + q.getParameterValue("fabricante") + ", " + nombre);
        
        return q.getResultList();
    }
}
