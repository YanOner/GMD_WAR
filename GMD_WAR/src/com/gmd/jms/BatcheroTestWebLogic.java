package com.gmd.jms;

import java.util.Hashtable;

import javax.jms.ObjectMessage;
import javax.jms.Queue;
import javax.jms.QueueConnection;
import javax.jms.QueueConnectionFactory;
import javax.jms.QueueSender;
import javax.jms.QueueSession;
import javax.jms.Session;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;

public class BatcheroTestWebLogic {

	Context ctx = null;

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		BatcheroTestWebLogic obj = new BatcheroTestWebLogic();
		try {
			obj.inicializandoContexto();
			// batchero Tasacion
			obj.enviarMensaje(
					"ConnectionFactory",
					"./SMOTributos!JMSServerTributos@MessageDestination",
					"SELECTOR.REGISTRO_BUZONONR",
					"HOLA");
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public void inicializandoContexto() throws NamingException {
		// MockitoAnnotations.initMocks(this);
		ctx = setContextDetails();

	}

	public void enviarMensaje(String conexion, String cola, String aplicacion,String mensaje)
			throws Exception {
		System.out.println("Preparando Mensaje para aplicacion " + aplicacion);

		QueueConnectionFactory queueConnectionFactory = (QueueConnectionFactory) ctx.lookup(conexion);
		QueueConnection connection = queueConnectionFactory.createQueueConnection();
		QueueSession session = connection.createQueueSession(false,	Session.AUTO_ACKNOWLEDGE);
		Queue myQueue = session.createQueue(cola);
		QueueSender mySender = session.createSender(myQueue);
		ObjectMessage oMessage = session.createObjectMessage();
		//seteando el mensaje a enviar
		oMessage.setObject(mensaje);
		oMessage.setJMSCorrelationID("1234");
		oMessage.setStringProperty("application", aplicacion);

		connection.start();
		mySender.send(oMessage);
		session.close();

		System.out.println("Se envió mensaje " + oMessage.toString());

	}

	public static Context setContextDetails() throws NamingException {
		Hashtable<String, String> envProps = new Hashtable<String, String>();
		envProps.put(Context.PROVIDER_URL, "t3://localhost:7001"); // puerto de JNDI
		envProps.put(Context.INITIAL_CONTEXT_FACTORY,"weblogic.jndi.WLInitialContextFactory"); // lo obtienes de jndi properties.file
		envProps.put(Context.URL_PKG_PREFIXES, "weblogic.jndi.factories");
		Context ctx = new InitialContext(envProps); // hace una conexion a JNDI
		return ctx;
	}

}
