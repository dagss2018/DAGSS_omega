/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package es.uvigo.esei.dagss.controladores.medico;

import es.uvigo.esei.dagss.dominio.daos.MedicamentoDAO;
import es.uvigo.esei.dagss.dominio.entidades.Medicamento;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.enterprise.context.RequestScoped;
import javax.enterprise.context.SessionScoped;
import javax.faces.view.ViewScoped;
import javax.inject.Inject;
import javax.inject.Named;

/**
 *
 * @author bavalencia_ESEI
 */
@Named(value = "buscadorControlador")
@ViewScoped
public class BuscadorControlador implements Serializable{

    private String bPrincipioActivo;
    private String bNombreMedicamento;
    private String bNombreFamilia;
    private String bNombreFabricante;
    
    private List<Medicamento> medicamentosBuscados;

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

    public List<Medicamento> getMedicamentosBuscados() {
        if(this.medicamentosBuscados == null){
            this.medicamentosBuscados = new ArrayList<Medicamento>();
        }
        System.out.println("Hay " + this.medicamentosBuscados.size());
        return medicamentosBuscados;
    }

    public void setMedicamentosBuscados(List<Medicamento> medicamentosBuscados) {
        this.medicamentosBuscados = medicamentosBuscados;
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

    public void buscarFabricantes(String query) {
        medicamentosBuscados = medicamentoDAO.buscarFabricantes(query);
    }

    public List<String> buscarFamilias(String query) {
        return medicamentoDAO.buscarFamilias(this.bNombreFamilia);
    }
}
