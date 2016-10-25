package com.gmt;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 * Clase que contiene la data para el envio de mensajes
 * al Buzon Electronico usando Colas JMS.
 *  
 * @author Juan Paulino
 * @since 26-02-2008
 * @version 1.0
 * */
public class BeMensajeAppBean implements Serializable {
	private static final long serialVersionUID = 1L;
	protected String	ind_tipmsj;		  	// 		1:mensaje  , 2:notificacion	
	protected String	des_asunto;       	//		asunto del mensaje
	protected String	msj_mensaje;      	//		texto del mensaje. para el caso de template, manda valores en formato casilla = valor 
	protected String	cod_usremisor;    	//    	UsuarioBean.login;
	protected String	ind_texto;        	//    	1:Texto 2:Html 3:Template
	protected String    fec_publica; 		// 		fecha y hora de publicacion (dd/mm/yyyy-hh24:mi:ss) 		      	
	protected String    fec_vigencia;     	//   	vigencia del mensaje (dd/mm/yyyy)
	protected String    codigoTemplate;     //      numero de ticket
	protected List		listaDestinatarios; //		lista de rucs (10)	
	protected List		listaDocumentos;    // 		lista de documentos adjuntos(3).  
	protected String 	modoProceso;		//		0:lista de destinatarios<=10, 1:procesamiento masivo
	
	public String getCod_usremisor() {
		return cod_usremisor;
	}
	
	public void setCod_usremisor(String cod_usremisor) {
		this.cod_usremisor = cod_usremisor;
	}
	
	public String getCodigoTemplate() {
		return codigoTemplate;
	}
	
	public void setCodigoTemplate(String codigoTemplate) {
		this.codigoTemplate = codigoTemplate;
	}
	
	public String getDes_asunto() {
		return des_asunto;
	}
	
	public void setDes_asunto(String des_asunto) {
		this.des_asunto = des_asunto;
	}
	
	public String getFec_publica() {
		return fec_publica;
	}
	
	public void setFec_publica(String fec_publica) {
		this.fec_publica = fec_publica;
	}
	
	public String getFec_vigencia() {
		return fec_vigencia;
	}
	
	public void setFec_vigencia(String fec_vigencia) {
		this.fec_vigencia = fec_vigencia;
	}
	
	public String getInd_texto() {
		return ind_texto;
	}
	
	public void setInd_texto(String ind_texto) {
		this.ind_texto = ind_texto;
	}
	
	public String getInd_tipmsj() {
		return ind_tipmsj;
	}
	
	public void setInd_tipmsj(String ind_tipmsj) {
		this.ind_tipmsj = ind_tipmsj;
	}
	
	public List getListaDestinatarios() {
		if(this.listaDestinatarios==null)
			 listaDestinatarios= new ArrayList();
		return listaDestinatarios;
	}
	
	public void setListaDestinatarios(List listaDestinatarios) {
		this.listaDestinatarios = listaDestinatarios;
	}
	
	public List getListaDocumentos() {
		if( this.listaDocumentos ==null)
			this.listaDocumentos= new ArrayList();
		return listaDocumentos;
	}
	
	public void setListaDocumentos(List listaDocumentos) {
		this.listaDocumentos = listaDocumentos;
	}
	
	public String getMsj_mensaje() {
		return msj_mensaje;
	}
	
	public void setMsj_mensaje(String msj_mensaje) {
		this.msj_mensaje = msj_mensaje;
	}
	
	public String getModoProceso() {
		return modoProceso;
	}

	public void setModoProceso(String modoProceso) {
		this.modoProceso = modoProceso;
	}
}
