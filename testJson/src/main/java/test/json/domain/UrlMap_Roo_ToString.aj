// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package test.json.domain;

import java.lang.String;

privileged aspect UrlMap_Roo_ToString {
    
    public String UrlMap.toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Id: ").append(getId()).append(", ");
        sb.append("LongUrl: ").append(getLongUrl()).append(", ");
        sb.append("ShortUrl: ").append(getShortUrl()).append(", ");
        sb.append("Version: ").append(getVersion());
        return sb.toString();
    }
    
}
