package com.gmd.buzon;

import org.springframework.remoting.jaxrpc.JaxRpcPortProxyFactoryBean;

public class BuzonPortProxyFactoryBean extends JaxRpcPortProxyFactoryBean {
/*
    protected void postProcessJaxRpcService(Service service) {
        TypeMappingRegistry registry = service.getTypeMappingRegistry();
        TypeMapping mapping = registry.createTypeMapping();
        registerBeanMapping(mapping, BeMensajeAppBean.class, "BeMensajeAppBean");
        registry.register("http://schemas.xmlsoap.org/soap/encoding/", mapping);
    }

    @SuppressWarnings("rawtypes")
	protected void registerBeanMapping(TypeMapping mapping, Class type, String name){
        QName qName = new QName("java:pe.gob.sunat.framework.util.buzon.bean", name);
        mapping.register(type, qName,
            new BeanSerializerFactory(type, qName),
            new BeanDeserializerFactory(type, qName));
    }
*/
}
