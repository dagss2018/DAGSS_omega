/*
 Proyecto Java EE, DAGSS-2013
 */
package es.uvigo.esei.dagss.controladores.medico;

import es.uvigo.esei.dagss.controladores.autenticacion.AutenticacionControlador;
import es.uvigo.esei.dagss.dominio.daos.CitaDAO;
import es.uvigo.esei.dagss.dominio.daos.MedicamentoDAO;
import es.uvigo.esei.dagss.dominio.daos.MedicoDAO;
import es.uvigo.esei.dagss.dominio.daos.PacienteDAO;
import es.uvigo.esei.dagss.dominio.daos.PrescripcionDAO;
import es.uvigo.esei.dagss.dominio.entidades.Cita;
import es.uvigo.esei.dagss.dominio.entidades.EstadoCita;
import es.uvigo.esei.dagss.dominio.entidades.Medicamento;
import es.uvigo.esei.dagss.dominio.entidades.Medico;
import es.uvigo.esei.dagss.dominio.entidades.Paciente;
import es.uvigo.esei.dagss.dominio.entidades.Prescripcion;
import es.uvigo.esei.dagss.dominio.entidades.TipoUsuario;
import es.uvigo.esei.dagss.dominio.planPrescripcion.PrescripcionFacade;
import javax.inject.Named;
import javax.enterprise.context.SessionScoped;
import java.io.Serializable;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import javax.inject.Inject;

/**
 *
 * @author ribadas
 */

@Named(value = "medicoControlador")
@SessionScoped
public class MedicoControlador implements Serializable {

    private Medico medicoActual;
    private String dni;
    private String numeroColegiado;
    private String password;

    private List<Cita> listCitaMedico;
    
    private Cita citaActual;
    private Paciente pacienteActual;
    private List<Prescripcion> prescripcionesPacienteActual;
    private List<EstadoCita> listEstados;
    
    private Prescripcion prescripcionActual;
    
    @Inject
    private AutenticacionControlador autenticacionControlador;
    @EJB
    private CitaDAO citaDAO;

    @EJB
    private MedicoDAO medicoDAO;
    
    @EJB
    private PacienteDAO pacienteDAO;
    
    @EJB
    private PrescripcionDAO prescripcionDAO;

    @EJB
    private MedicamentoDAO medicamentoDAO;
    
    @EJB
    private PrescripcionFacade prescripcionFacade;
    /**
     * Creates a new instance of AdministradorControlador
     */
    public MedicoControlador() {
    }

    public String getDni() {
        return dni;
    }

    public void setDni(String dni) {
        this.dni = dni;
    }

    public String getNumeroColegiado() {
        return numeroColegiado;
    }

    public void setNumeroColegiado(String numeroColegiado) {
        this.numeroColegiado = numeroColegiado;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Medico getMedicoActual() {
        return medicoActual;
    }

    public void setMedicoActual(Medico medicoActual) {
        this.medicoActual = medicoActual;
    }
    
    public Paciente getPacienteActual(){
        return this.pacienteActual;
    }
    
    public void setPacienteActual(Paciente p){
        this.pacienteActual = p;
    }
    
    public List<Prescripcion> getPrescripcionesPaciente(){
        return this.prescripcionesPacienteActual;
    }
    
    public void setPrescripcionesPaciente(List<Prescripcion> p){
        this.prescripcionesPacienteActual = p;
    }
    
    public Cita getCitaActual(){
        return this.citaActual;
    }
    
    public void setCitaActual(Cita c){
        this.citaActual = c;
    }

    public Prescripcion getPrescripcionActual(){
        return this.prescripcionActual;
    }
    
    public void setPrescripcionActual(Prescripcion p){
        this.prescripcionActual = p;
    }
    
    private boolean parametrosAccesoInvalidos() {
        return (((dni == null) && (numeroColegiado == null)) || (password == null));
    }

    private Medico recuperarDatosMedico() {
        Medico medico = null;
        if (dni != null) {
            medico = medicoDAO.buscarPorDNI(dni);
        }
        if ((medico == null) && (numeroColegiado != null)) {
            medico = medicoDAO.buscarPorNumeroColegiado(numeroColegiado);
        }
        return medico;
    }

    public String doLogin() {
        String destino = null;
        if (parametrosAccesoInvalidos()) {
            FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_WARN, "No se ha indicado un DNI ó un número de colegiado o una contraseña", ""));
        } else {
            Medico medico = recuperarDatosMedico();
            if (medico == null) {
                FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_WARN, "No existe ningún médico con los datos indicados", ""));
            } else {
                if (autenticacionControlador.autenticarUsuario(medico.getId(), password,
                        TipoUsuario.MEDICO.getEtiqueta().toLowerCase())) {
                    medicoActual = medico;
                    destino = "privado/index";
                } else {
                    FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_WARN, "Credenciales de acceso incorrectas", ""));
                }
            }
        }
        return destino;
    }

    //Acciones
    public String doShowCita() {
        return "detallesCita";
    }

    
     public List<Cita> getListCitaMedico() {
        return listCitaMedico;
    }

    public void setListCitaMedico(List<Cita> listCitaMedico) {
        this.listCitaMedico = listCitaMedico;
    }
    
     public List<EstadoCita> getListEstados() {
        return listEstados;
    }

    public void setListEstados(List<EstadoCita> listEstados) {
        this.listEstados = listEstados;
    }
    
    public List<Cita> doBuscarCitasMedico(Date date){
        return citaDAO.getCitasPara(medicoActual, date);
    }
    
    public String doBuscarCitasMedicoHoy(){
        this.listCitaMedico = doBuscarCitasMedico(new Date(new Date().getTime()));
        return "/medico/privado/agenda/listadoCitas";
    }
    
    public String doAtenderPaciente(Cita cita){
        if(cita.getEstado().equals(cita.getEstado().PLANIFICADA)){
            this.citaActual = cita;
            this.pacienteActual = cita.getPaciente();
            this.prescripcionesPacienteActual = pacienteDAO.buscarPrescripcionesVigentes(pacienteActual);
            this.listEstados = new LinkedList<EstadoCita>();
            for(EstadoCita e : EstadoCita.values()){
                listEstados.add(e);
            }
        
            return "/medico/privado/paciente/atencionAlPaciente";
        }
        return "";
    }
    
    public String doEliminarPrescripcion(Prescripcion p){
        prescripcionDAO.eliminar(p);
        this.prescripcionesPacienteActual = pacienteDAO.buscarPrescripcionesVigentes(pacienteActual);
        
        return "/medico/privado/paciente/atencionAlPaciente";
    }
    
    public String doNuevaPrescripcion(){
        this.prescripcionActual = new Prescripcion();
        this.prescripcionActual.setMedicamento(new Medicamento());
        
        return "/medico/privado/paciente/prescripcionCrear";
    }
    
    public String doGuardarNuevaPrescripcion(){
        prescripcionActual.setFechaInicio(new Date(new Date().getTime()));
        prescripcionActual.setMedico(medicoActual);
        prescripcionActual.setMedicamento(medicamentoDAO.buscarPorId(prescripcionActual.getMedicamento().getId()));
        prescripcionActual.setPaciente(pacienteActual);
        
        prescripcionDAO.crear(prescripcionActual);
        prescripcionFacade.crearPlanificador();
        prescripcionFacade.planificar(prescripcionActual);
        
        
        this.prescripcionesPacienteActual = pacienteDAO.buscarPrescripcionesVigentes(pacienteActual);
        
        return "/medico/privado/paciente/atencionAlPaciente";
    }
    
    public String doFinalizarCita(){
        citaDAO.actualizar(citaActual);
        citaActual = null;
        pacienteActual = null;
        prescripcionesPacienteActual = null;
        
        return "/medico/privado/agenda/listadoCitas";
    }
}
