/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package es.uvigo.esei.dagss.dominio.planPrescripcion;

import es.uvigo.esei.dagss.dominio.entidades.EstadoReceta;
import es.uvigo.esei.dagss.dominio.entidades.Prescripcion;
import es.uvigo.esei.dagss.dominio.entidades.Receta;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;
import javax.ejb.Stateless;

/**
 *
 * @author Miguel
 */
@Stateless
public class PlanificadorRecetasSemanal implements PlanificadorRecetas {

    @Override
    public List<Receta> planificarPrescripcion(Prescripcion prescripcion) {

        List<Receta> recetas = new ArrayList<>();

        Date fechaInicio = prescripcion.getFechaInicio();
        Date fechaFin = prescripcion.getFechaFin();

        //Numero de dias de la prescripcion
        int diasPrescripcion = (int) ((fechaFin.getTime() - fechaInicio.getTime()) / 86400000) + 1;
        /**OJITO CON LOS PRINTS**/
        System.out.println("Fecha inicio: " + fechaInicio.getTime() / 86400000);
        System.out.println("Fecha fin: " + fechaFin.getTime() / 86400000);
        System.out.print("diasPrescripcion  " + diasPrescripcion);

        //Numero de dias que dura una caja
        int totalDiasCaja = (int) Math.ceil((double) prescripcion.getMedicamento().getNumeroDosis() / (double) prescripcion.getDosis());
        /**OJITO CON LOS PRINTS**/
        System.out.println("Numero de dosis del medicamento: " + prescripcion.getMedicamento().getNumeroDosis());
        System.out.println("Numero de dosis: " + prescripcion.getDosis());
        System.out.println("prueba : " + (int) Math.ceil(2 / 10));
        System.out.print("totalDiasCaja " + totalDiasCaja);

        //Calcular el numero total de recetas
        int totalRecetas = (int) Math.ceil((double) diasPrescripcion / totalDiasCaja);
        /**OJITO CON LOS PRINTS**/
        System.out.print("totalRecetas " + totalRecetas);
        Date inicioValidezReceta = fechaInicio;

        Date fechaReceta = fechaInicio;

        Calendar calendar;
        calendar = GregorianCalendar.getInstance();

        Date finValidezReceta = null;
        calendar.setTime(fechaReceta);
        calendar.add(GregorianCalendar.DAY_OF_YEAR, totalDiasCaja + 7);
        finValidezReceta = calendar.getTime();

        for (int i = 0; i < totalRecetas; i++) {

            recetas.add(new Receta(prescripcion, 1, inicioValidezReceta, finValidezReceta, EstadoReceta.GENERADA));

            calendar = GregorianCalendar.getInstance();
            calendar.setTime(fechaReceta);
            calendar.add(GregorianCalendar.DAY_OF_YEAR, totalDiasCaja);
            fechaReceta = calendar.getTime();

            calendar = GregorianCalendar.getInstance();
            calendar.setTime(fechaReceta);
            calendar.add(GregorianCalendar.DAY_OF_YEAR, -7);
            inicioValidezReceta = calendar.getTime();

            calendar = GregorianCalendar.getInstance();
            calendar.setTime(fechaReceta);
            calendar.add(GregorianCalendar.DAY_OF_YEAR, 7);
            finValidezReceta = calendar.getTime();

//            calendar.setTime(finValidezReceta);
//            calendar.add(GregorianCalendar.DAY_OF_YEAR,- 7 + totalDiasCaja );
//            inicioValidezReceta = calendar.getTime();
//            calendar.setTime(finValidezReceta);
//            calendar.add(GregorianCalendar.DAY_OF_YEAR,7);
//            finValidezReceta = calendar.getTime();           
        }

        return recetas;
    }

}
