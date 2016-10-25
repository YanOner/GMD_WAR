package com.gmt;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class Principal {

	public static void main(String[] args) throws ParseException {
		System.out.println("GMALEX");
		System.out.println(validaRuc("20100066608"));
		
	}
	
	/**
     * M�todo que formatea un afecha en base al formato pasado como
     * par�metro.
     * @param fecha: fecha a formatear
     * @param pattern: formato que se dar� a la fecha.
     * @return Fecha formateada en base al formato de pattern.
     * null si se presenta alguna excepci�n
     */
    public static Date formatearDate(Date fecha, String pattern) {
        SimpleDateFormat formato = new SimpleDateFormat(pattern);
        Date fechaFormateada = null;
        try {
            fechaFormateada = formato.parse(formato.format(fecha));
            return fechaFormateada;
        } catch (Exception ex) {
            return fechaFormateada;
        }
    }    
 
    /**
     * M�todo que remplaza el a�o y el mes de fecha y pone
     * el a�o y mes de fechaActual
     * @param fecha: fecha a remplazar el mes y el a�o
     * @param fechaActual: fecha de la cual se tomara el mes y el a�o
     * y se colocara en fecha
     * @return Calendar con la nueva fecha calculada.
     */
    public static Calendar ponerAnioMesActual(Date fecha, Date fechaActual) {
        try {
            Calendar cActual = Calendar.getInstance();
            cActual.setTime(fechaActual);
            Calendar cfecha = Calendar.getInstance();
            cfecha.setTime(fecha);
            //la fecha nueva
            Calendar c1 = Calendar.getInstance();
            c1.set(cActual.get(Calendar.YEAR), cActual.get(Calendar.MONTH), cfecha.get(Calendar.DATE));
            return c1;
        } catch (Exception e) {
            return null;
        }
    }
 
    /**
     * M�todo que calcula los meses que han pasado dese fecha inicio hasta
     * fecha fin.
     * @param fechaInicio: fecha de inicio de comparaci�n.
     * @param fechaFin: fecha de finalizaci�n de comparaci�n.
     * @return 0 si no ha pasado un mes o si se presenta alguna exepci�n.
     * > 0 si han pasado almenos un mes.
     */
    public static int calcularMesesAFecha(Date fechaInicio, Date fechaFin) {
        try {
            //Fecha inicio en objeto Calendar
            Calendar startCalendar = Calendar.getInstance();
            startCalendar.setTime(fechaInicio);
            //Fecha finalizaci�n en objeto Calendar
            Calendar endCalendar = Calendar.getInstance();
            endCalendar.setTime(fechaFin);
            //C�lculo de meses para las fechas de inicio y finalizaci�n
            int startMes = (startCalendar.get(Calendar.YEAR) * 12) + startCalendar.get(Calendar.MONTH);
            int endMes = (endCalendar.get(Calendar.YEAR) * 12) + endCalendar.get(Calendar.MONTH);
            //Diferencia en meses entre las dos fechas
            int diffMonth = endMes - startMes;
            //Si la el d�a de la fecha de finalizaci�n es menor que el d�a de la fecha inicio
            //se resta un mes, puesto que no estaria cumpliendo otro periodo.
            //Para esto ocupo el metoddo ponerAnioMesActual
            Date aFecha = ponerAnioMesActual(fechaInicio,fechaFin).getTime();
            if(formatearDate(fechaFin, "dd/MM/yyyy").compareTo(
                    formatearDate(aFecha,"dd/MM/yyyy")) < 0){
                diffMonth = diffMonth - 1;
            }
            //Si la fecha de finalizaci�n es menor que la fecha de inicio, retorno que los meses
            // transcurridos entre las dos fechas es 0
            if(diffMonth < 0){
                diffMonth = 0;
            }
            return diffMonth;
        } catch (Exception e) {
        	e.printStackTrace();
            return 0;
        }
    }
	
    private static boolean validaRuc(String ruc){
        ruc = ruc.trim();
        if(isNumeric(ruc) && ruc.length() == 11) {
            int suma = 0;
            int i = 0;
            int x = 6;
            for(; i < ruc.length() - 1; i++)
            {
                if(i == 4)
                    x = 8;
                int digito = ruc.charAt(i) - 48;
                suma += digito * --x;
            }

            int resto = suma % 11;
            resto = 11 - resto;
            if(resto >= 10)
                resto -= 10;
            if(resto == ruc.charAt(ruc.length() - 1) - 48)
                return true;
        }
        return false;
    }
    
    private static boolean isNumeric(String value){
        boolean isNumber = false;
        for(int i = 0; i < value.length() - 1; i++) {
            char caracter = value.charAt(i);
            if(caracter < '0' || caracter > '9')
                break;
            isNumber = true;
        }

        return isNumber;
    }
    
}
