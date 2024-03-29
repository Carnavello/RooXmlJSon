// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package test.json.web;

import java.io.UnsupportedEncodingException;
import java.lang.Integer;
import java.lang.Long;
import java.lang.String;
import java.util.Collection;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;
import test.json.domain.UrlMap;

privileged aspect UrlMapController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST)
    public String UrlMapController.create(@Valid UrlMap urlMap, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            uiModel.addAttribute("urlMap", urlMap);
            return "urlmaps/create";
        }
        uiModel.asMap().clear();
        urlMap.persist();
        return "redirect:/urlmaps/" + encodeUrlPathSegment(urlMap.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", method = RequestMethod.GET)
    public String UrlMapController.createForm(Model uiModel) {
        uiModel.addAttribute("urlMap", new UrlMap());
        return "urlmaps/create";
    }
    
    @RequestMapping(method = RequestMethod.GET)
    public String UrlMapController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            uiModel.addAttribute("urlmaps", UrlMap.findUrlMapEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) UrlMap.countUrlMaps() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("urlmaps", UrlMap.findAllUrlMaps());
        }
        return "urlmaps/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String UrlMapController.update(@Valid UrlMap urlMap, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            uiModel.addAttribute("urlMap", urlMap);
            return "urlmaps/update";
        }
        uiModel.asMap().clear();
        urlMap.merge();
        return "redirect:/urlmaps/" + encodeUrlPathSegment(urlMap.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", method = RequestMethod.GET)
    public String UrlMapController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("urlMap", UrlMap.findUrlMap(id));
        return "urlmaps/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public String UrlMapController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        UrlMap.findUrlMap(id).remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/urlmaps";
    }
    
    @ModelAttribute("urlmaps")
    public Collection<UrlMap> UrlMapController.populateUrlMaps() {
        return UrlMap.findAllUrlMaps();
    }
    
    String UrlMapController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        }
        catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}
