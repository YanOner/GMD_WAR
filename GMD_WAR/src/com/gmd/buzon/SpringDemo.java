package com.gmd.buzon;

import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.xml.namespace.QName;
import javax.xml.rpc.ParameterMode;
import javax.xml.rpc.encoding.XMLType;

import org.apache.axis.client.Call;
import org.apache.axis.client.Service;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class SpringDemo {

	public static void main(String[] args) {
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		EnviaMensajeBuzonService embs = (EnviaMensajeBuzonService) context.getBean("buzonWebService");
		System.out.println(embs);
		List<String> dest = new ArrayList <String> ();
		dest.add("20600667611");
		BeMensajeAppBean msj = new BeMensajeAppBean();
		msj.setInd_tipmsj("1");
		msj.setDes_asunto("ASUNTO PRUEBA");
		msj.setMsj_mensaje("TEXT MENSAJE PRUEBA");
		msj.setCod_usremisor("SUNAT");
		msj.setInd_texto("1");
		msj.setFec_publica(new SimpleDateFormat("dd/MM/yyyy-HH:mm:ss").format(new Date()));
		msj.setFec_vigencia(new SimpleDateFormat("dd/MM/yyyy-HH:mm:ss").format(new Date(new Date().getTime()+new Date().getTime())));
		msj.setListaDestinatarios(dest);
		enviaBuzon(msj);
//		int valor = embs.enviaBuzon(msj);
//		System.out.println("Resultado: "+valor);
	}
	
	public static void enviaBuzon(BeMensajeAppBean msg) {
		try {
			Service service = new Service();
			Call call = (Call) service.createCall();
			
			QName qnMsg = new QName("java:pe.gob.sunat.framework.util.buzon.bean", "BeMensajeAppBean");
			
			call.registerTypeMapping(BeMensajeAppBean.class, qnMsg,
									new org.apache.axis.encoding.ser.BeanSerializerFactory(BeMensajeAppBean.class, qnMsg),
									new org.apache.axis.encoding.ser.BeanDeserializerFactory(BeMensajeAppBean.class, qnMsg));
			
			call.setTargetEndpointAddress(new URL("http://192.168.46.20:8080/cl-ti-iawsbuzon/ws-enviabuzon?WSDL"));
			call.setOperationName("enviaBuzon");
			call.addParameter("beanApp", qnMsg, ParameterMode.IN);
			call.setReturnType(XMLType.XSD_INT);
			
			System.out.println("Respuesta del envio al buzon --> " + call.invoke(new Object[] {msg}));
		}
		catch(Throwable e) {
			e.printStackTrace();
		}
	}

}
