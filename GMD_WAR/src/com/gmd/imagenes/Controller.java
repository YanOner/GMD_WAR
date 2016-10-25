package com.gmd.imagenes;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

public class Controller {

	@RequestMapping(value = "/guardarItemTasado", method = RequestMethod.POST, consumes = MediaType.MULTIPART_FORM_DATA_VALUE, produces = MediaType.TEXT_HTML_VALUE)
    public @ResponseBody void guardarItemTasado(HttpServletRequest request,
    		@RequestParam("codigoMov") String codigoMov,
    		@RequestParam("codigoItem") Integer codigoItem,
    		@RequestParam("listaItemsTasados") String strListaItemsTasados,
    		@RequestParam("hdn_adj_imgBien") MultipartFile[] multipartRequest
    		){
		
	}
	
}
