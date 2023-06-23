package com.oidc.hotplace.test;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@Slf4j
public class Controller {

    @GetMapping(value = "/test")
    public String test(){
        log.info("입력들어옴");
        return "안녕하세요 테스트입니다.";
    }
}
