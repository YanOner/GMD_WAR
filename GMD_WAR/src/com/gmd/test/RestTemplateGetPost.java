
package com.gmd.test;
import java.util.HashMap;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.http.converter.StringHttpMessageConverter;
import org.springframework.http.converter.json.MappingJacksonHttpMessageConverter;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.databind.ObjectMapper;

public class RestTemplateGetPost {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		System.out.println("INICIO - TEST");
		consultarTicket();
		
		generarTicket();
		System.out.println("FIN - TEST");
	}

	private static void generarTicket() {
		System.out.println("INICIO - generarTicket");
		try {
			MultiValueMap<String, Object> params = new LinkedMultiValueMap<String, Object>();
			// Map<String, Object> params = new HashMap<String, Object>();
			params.add("CANAL", 3);// Valor Por Defecto = 3
			params.add("PRODUCTO", 1);// (Comercio electrónico – Formulario de
										// pagos) = 1
			params.add("CODTIENDA", "T00000001");
			params.add("NUMORDEN", "1");
			params.add("MOUNT", "1000");
			params.add("NOMBRE", "NOM POSTOR");
			params.add("APELLIDO", "APE POSTOS");
			params.add("CORREO", "EMAIL POSTOR");
			params.add("DIRECCION", "DIR POSTOR");
			params.add("CIUDAD", "LIMA");// postor.getCod_depa().concat(postor.getCod_prov()).concat(postor.getCod_dist()));
			params.add("CODASOCIADO", "123");
			params.add("NOMBREASOCIADO", "SUNAT");
			params.add("MCC", "555");
			params.add("DATO_COMERCIO", "-");

			System.out.println("Parametros: " + params);
			// String url =
			// "http://api.sunat.peru/v1/tecnologia/arquitectura/externos/com/visanet/e/eticket";
			String url = "http://150.100.21.180:7080/v1/tecnologia/arquitectura/externos/com/visanet/e/eticket";
//			String url = "http://httpbin.org/post";
			System.out.println("URL: " + url);
			RestTemplate restTemplate = new RestTemplate();
			restTemplate.getMessageConverters().add(
					new MappingJacksonHttpMessageConverter());
			restTemplate.getMessageConverters().add(
					new StringHttpMessageConverter());
			HttpHeaders headers = new HttpHeaders();
			headers.setContentType(MediaType.APPLICATION_JSON);
			HttpEntity<MultiValueMap<String, Object>> requestEntity = new HttpEntity<MultiValueMap<String, Object>>(
					params, headers);
			ResponseEntity<String> restRespuesta = restTemplate.exchange(url,HttpMethod.POST, requestEntity, String.class);
			// Map<String, Object> restRespuesta =
			// restTemplate.postForObject("http://api.sunat.peru/v1/tecnologia/arquitectura/externos/com/visanet/e/eticket",
			// params,Map.class);
			System.out.println("Respuesta: " + restRespuesta.toString());
			// String eticket = (String) restRespuesta.get("eticket");
			HttpStatus httpStatus = restRespuesta.getStatusCode();
			String restBody = restRespuesta.getBody();
			HashMap<String, String> obj = new ObjectMapper().readValue(restBody, HashMap.class);
			System.out.println("Mapa: " + obj.toString());
		} catch (Exception e) {
			System.out.println("ERROR EN generarTicket");
			e.printStackTrace();
		}
		System.out.println("FIN - generarTicket");
	}

	private static void consultarTicket() {
		System.out.println("INICIO - consultarTicket");
		try {
			String codtienda = "T00000001";
			String eticket = "E0000123456789";
//			String url = "http://api.sunat.peru/v1/tecnologia/arquitectura/externos/com/visanet/e/eticket";
			String url = "http://150.100.21.180:7080/v1/tecnologia/arquitectura/externos/com/visanet/e/eticket";
			url += "?codTienda="+codtienda+"&eticket="+eticket;
//			String url = "http://httpbin.org/get";
			System.out.println("URL: "+url);
			RestTemplate restTemplate = new RestTemplate();
			restTemplate.getMessageConverters().add(new MappingJacksonHttpMessageConverter());
			restTemplate.getMessageConverters().add(new StringHttpMessageConverter());
			HttpHeaders headers = new HttpHeaders();
		    headers.setContentType(MediaType.APPLICATION_JSON);
		    HttpEntity<String> requestEntity = new HttpEntity<String>(headers);
			ResponseEntity<String> restRespuesta = restTemplate.exchange(url, HttpMethod.GET, requestEntity, String.class);
//			String respuesta = restTemplate.getForObject(url, String.class);
			System.out.println("Respuesta: "+restRespuesta.toString());
//			String eticket = (String) restRespuesta.get("eticket");
			HttpStatus httpStatus = restRespuesta.getStatusCode();
			String restBody = restRespuesta.getBody();
			HashMap<String, String> mapVisaRespuesta = new ObjectMapper().readValue(restBody, HashMap.class);
			System.out.println("Mapa: "+mapVisaRespuesta.toString());
		} catch (Exception e) {
			System.out.println("ERROR EN consultarTicket");
			e.printStackTrace();
		}
		System.out.println("FIN - consultarTicket");
	}

}
