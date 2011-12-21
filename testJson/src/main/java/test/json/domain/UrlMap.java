package test.json.domain;

import org.springframework.roo.addon.entity.RooEntity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;
import org.springframework.roo.addon.json.RooJson;
import javax.validation.constraints.NotNull;
import javax.persistence.Column;

@RooJavaBean
@RooToString
@RooEntity
@RooJson
public class UrlMap {

    @NotNull
    @Column(name = "SHORTURL")
    private String shortUrl;

    @NotNull
    @Column(name = "LONGURL")
    private String longUrl;
}
