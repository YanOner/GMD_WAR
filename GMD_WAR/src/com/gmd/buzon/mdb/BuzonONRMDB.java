package pe.gob.sunat.contribuyente2.registro.buzononr.ejb.mdb;

import javax.ejb.ActivationConfigProperty;
import javax.ejb.MessageDriven;
import javax.ejb.TransactionManagement;
import javax.ejb.TransactionManagementType;
import javax.interceptor.Interceptors;
import javax.jms.Message;
import javax.jms.MessageListener;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ejb.interceptor.SpringBeanAutowiringInterceptor;

import pe.gob.sunat.contribuyente2.registro.buzononr.service.BuzonONRService;

/**
 * Message-Driven Bean implementation class for: BuzonONRMDB
 * @author GMALEX
 */
@TransactionManagement(TransactionManagementType.BEAN)
@Interceptors(SpringBeanAutowiringInterceptor.class)
@MessageDriven(name = "BuzonONRMDB", activationConfig = { 
		@ActivationConfigProperty(propertyName = "destinationType", propertyValue = "javax.jms.Queue"),
		@ActivationConfigProperty(propertyName = "destination", propertyValue = "queue/messageDestination"),
		@ActivationConfigProperty(propertyName = "messagingType", propertyValue = "javax.jms.MessageListener"),
		@ActivationConfigProperty(propertyName = "messageSelector", propertyValue = "application = 'SELECTOR.REGISTRO_BUZONONR'")
																																																									 
})
public class BuzonONRMDB implements MessageListener  {
	
	protected final Log log = LogFactory.getLog(getClass());
	
	@Autowired
	BuzonONRService buzonONRService;
	
	@Override
	public void onMessage(Message message) {
		log.info("Inicio - BuzonONRMDB");
		try {
			buzonONRService.enviarBuzonMensajeONR();
		} catch (Exception e) {
			log.error("ERROR: BuzonONRMDB", e);
		}
		log.info("Fin - BuzonONRMDB");
	}
	
}
