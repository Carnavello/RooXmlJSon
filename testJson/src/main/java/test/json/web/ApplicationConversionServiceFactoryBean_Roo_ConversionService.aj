// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package test.json.web;

import java.lang.String;
import org.springframework.core.convert.converter.Converter;
import org.springframework.format.FormatterRegistry;
import test.json.domain.UrlMap;

privileged aspect ApplicationConversionServiceFactoryBean_Roo_ConversionService {
    
    public void ApplicationConversionServiceFactoryBean.installLabelConverters(FormatterRegistry registry) {
        registry.addConverter(new UrlMapConverter());
    }
    
    public void ApplicationConversionServiceFactoryBean.afterPropertiesSet() {
        super.afterPropertiesSet();
        installLabelConverters(getObject());
    }
    
    static class test.json.web.ApplicationConversionServiceFactoryBean.UrlMapConverter implements Converter<UrlMap, String> {
        public String convert(UrlMap urlMap) {
            return new StringBuilder().append(urlMap.getShortUrl()).append(" ").append(urlMap.getLongUrl()).toString();
        }
        
    }
    
}
