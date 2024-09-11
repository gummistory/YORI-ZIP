package com.yorizip.myapp.Auth.service;

import com.yorizip.myapp.user.service.UserService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.*;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import javax.servlet.http.HttpSession;
import java.util.Map;
import java.util.Optional;

@Slf4j
public abstract class AbstractOAuthService implements OAuthService {
    protected final UserService userService;
    protected final RestTemplate restTemplate;
    protected final HttpSession httpSession;

    public AbstractOAuthService(UserService userService, RestTemplate restTemplate, HttpSession httpSession) {
        this.userService = userService;
        this.restTemplate = restTemplate;
        this.httpSession = httpSession;
    }

    protected abstract String getTokenUrl();
    protected abstract String getUserInfoUrl();
    protected abstract MultiValueMap<String, String> getTokenRequestParameters(String code);
    protected abstract HttpHeaders getUserInfoHeaders(String accessToken);

    @Override
    public String getAccessToken(String code) {
        log.info("Preparing to request access token with code: {}", code);

        // 토큰 요청 파라미터 구성
        MultiValueMap<String, String> parameters = getTokenRequestParameters(code);
        log.info("Token request parameters: {}", parameters);

        // 요청 헤더 설정
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);
        log.info("Request headers set to: {}", headers);

        // HttpEntity 생성
        HttpEntity<MultiValueMap<String, String>> request = new HttpEntity<>(parameters, headers);
        log.info("HttpEntity created for token request: {}", request);

        // 토큰 요청 수행
        log.info("Sending token request to URL: {}", getTokenUrl());
        ResponseEntity<Map> response = restTemplate.postForEntity(getTokenUrl(), request, Map.class);
        log.info("Received token response with status: {}", response.getStatusCode());

        // 응답 바디에서 액세스 토큰 추출
        Map<String, Object> responseBody = response.getBody();
        if (responseBody != null) {
            String accessToken = (String) responseBody.get("access_token");
            log.info("Access token received: {}", accessToken);
            return accessToken;
        } else {
            log.error("Failed to retrieve access token, response body is null");
            throw new RuntimeException("Access token retrieval failed, response body is null");
        }
    }

    @Override
    public Map<String, Object> getUserInfo(String accessToken) {
        HttpHeaders headers = getUserInfoHeaders(accessToken);
        HttpEntity<String> request = new HttpEntity<>(headers);
        ResponseEntity<Map> response = restTemplate.exchange(getUserInfoUrl(), HttpMethod.GET, request, Map.class);

        return response.getBody();
    }

    @Override
    public Boolean handleUser(Map<String, Object> userInfo, String provider) {
        String email;
        if ("kakao".equals(provider)) {
            email = (String) ((Map<String, Object>) userInfo.get("kakao_account")).get("email");
        } else if ("naver".equals(provider)) {
            email = (String) ((Map<String, Object>) userInfo.get("response")).get("email");
        } else {
            log.error("Unsupported provider: {}", provider);
            return false;
        }

        return Optional.ofNullable(email)
                .map(userService::findUserByEmail)
                .map(user -> {
                    httpSession.setAttribute("user", user);
                    return true;
                })
                .orElse(false);
    }
}

