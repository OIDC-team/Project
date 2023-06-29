package com.oidc.hotplace.openAPI;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@Slf4j
@RequestMapping("/hotplace")
public class HotplaceController {
    private HotplaceService hotplaceService;

    @Autowired
    public HotplaceController(HotplaceService hotplaceService){
        this.hotplaceService = hotplaceService;
    }

    @GetMapping("/api")
    public ResponseEntity<String> getHotplaceService(){
        log.info("요청 들어옴");
        return ResponseEntity.ok().body(hotplaceService.requestInfo());
    }    
}
