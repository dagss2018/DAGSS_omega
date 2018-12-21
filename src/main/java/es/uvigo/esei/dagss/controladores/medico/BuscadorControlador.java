/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package es.uvigo.esei.dagss.controladores.medico;

import es.uvigo.esei.dagss.dominio.daos.MedicamentoDAO;
import es.uvigo.esei.dagss.dominio.entidades.Medicamento;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.enterprise.context.RequestScoped;
import javax.enterprise.context.SessionScoped;
import javax.inject.Inject;
import javax.inject.Named;

/**
 *
 * @author bavalencia_ESEI
 */
@Named(value = "buscadorControlador")
@RequestScoped
public class BuscadorControlador {

    private String bPrincipioActivo;
    private String bNombreMedicamento;
    private String bNombreFamilia;
    private String bNombreFabricante;

    @Inject
    private MedicamentoDAO medicamentoDAO;

    @PostConstruct
    public void initStrings() {
        this.bPrincipioActivo = "";
        bNombreMedicamento = "";
        bNombreFamilia = "";
        bNombreFabricante = "";
    }

    public String getPrincipioActivo() {
        return bPrincipioActivo;
    }

    public void setPrincipioActivo(String bPrincipioActivo) {
        this.bPrincipioActivo = bPrincipioActivo;
    }

    public String getNombreMedicamento() {
        return bNombreMedicamento;
    }

    public void setNombreMedicamento(String bNombreMedicamento) {
        this.bNombreMedicamento = bNombreMedicamento;
    }

    public String getNombreFamilia() {
        return bNombreFamilia;
    }

    public void setNombreFamilia(String bNombreFamilia) {
        this.bNombreFamilia = bNombreFamilia;
    }

    public String getNombreFabricando() {
        return bNombreFabricante;
    }

    public void setNombreFabricando(String bNombreFabricando) {
        this.bNombreFabricante = bNombreFabricando;
    }

    public List<Medicamento> buscarMedicamentos(String query) {
        return medicamentoDAO.buscar(this.bNombreMedicamento, this.bNombreFabricante,
                this.bNombreFamilia, this.bPrincipioActivo);
    }

    public List<String> buscarPrincipiosActivos(String query) {
        return medicamentoDAO.buscarPrincipiosActivos(this.bPrincipioActivo);
    }

    public List<String> buscarNombresMedicamentos(String query) {
        this.bNombreMedicamento = query;
        return medicamentoDAO.buscarNombresMedicamentos(this.bNombreMedicamento);
    }

    public List<Medicamento> buscarFabricantes(String query) {
        System.out.println(">>>>  Entra con " + query);
        List<Medicamento> a = medicamentoDAO.buscarFabricantes(query);
        if (a != null) {
            System.out.println(">>>>>> es null");
        } else {
            System.out.println(">>>>>>>> " + a.size());
        }
        return a;
    }

    public List<String> buscarFamilias(String query) {
        return medicamentoDAO.buscarFamilias(this.bNombreFamilia);
    }
}
