package com.oidc.hotplace.openAPI;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.web.reactive.function.client.WebClient;

@Service
@Slf4j
public class HotplaceService {
    public String requestInfo(){
        WebClient web = WebClient.builder()
                .baseUrl("http://openapi.seoul.go.kr:8088/sample/xml/citydata/1/5/광화문·덕수궁")
                .codecs(configurer -> configurer.defaultCodecs().maxInMemorySize(-1)).build();

        log.info("중간점검");
        return web.get().retrieve().bodyToMono(String.class).block();
    }
}
