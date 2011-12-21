package test.json.web;

import net.sf.json.JSON;
import net.sf.json.JSONSerializer;
import net.sf.json.xml.XMLSerializer;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import test.json.domain.UrlMap;

@RooWebScaffold(path = "urlmaps", formBackingObject = UrlMap.class)
@RequestMapping("/urlmaps")
@Controller
public class UrlMapController {
	
	   @RequestMapping(value = "/{id}", method = RequestMethod.GET)
	    public String show(@PathVariable("id") Long id, Model uiModel) {
	        uiModel.addAttribute("urlmap", UrlMap.findUrlMap(id));
	        uiModel.addAttribute("itemId", id);
	        return "urlmaps/show";
	    }
	    
	   
	   
	   @RequestMapping(headers = "Accept=ws/xml")
	    @ResponseBody
	    public ResponseEntity<String> listXml() {
	        HttpHeaders headers = new HttpHeaders();
	        headers.add("Content-Type", "application/text; charset=utf-8");
	        String jsonString = UrlMap.toJsonArray(UrlMap.findAllUrlMaps());
	        XMLSerializer serializer = new XMLSerializer();
	        JSON json = JSONSerializer.toJSON(jsonString);
	        String xmlString = serializer.write(json);
	        return new ResponseEntity<String>(xmlString, headers, HttpStatus.OK);
	    }
	    
	    @RequestMapping(value = "/{id}", method = RequestMethod.GET, headers = "Accept=ws/xml")
	    @ResponseBody
	    public ResponseEntity<String> showXml(@PathVariable("id") Long id) {
	        UrlMap urlmap = UrlMap.findUrlMap(id);
	        HttpHeaders headers = new HttpHeaders();
	        headers.add("Content-Type", "application/text; charset=utf-8");
	        if (urlmap == null) {
	            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
	        }
	        String jsonString = urlmap.toJson();
	        XMLSerializer serializer = new XMLSerializer();
	        JSON json = JSONSerializer.toJSON(jsonString);
	        String xmlString = serializer.write(json);
	        return new ResponseEntity<String>(xmlString, headers, HttpStatus.OK);
	    }
}
