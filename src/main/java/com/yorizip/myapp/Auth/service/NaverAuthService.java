package com.yorizip.myapp.Auth.service;

import com.yorizip.myapp.user.service.UserService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import javax.servlet.http.HttpSession;

@Service
@Slf4j
public class NaverAuthService extends AbstractOAuthService {
    private final String clientId = "8njUNhQJZagPjfuWz7OM";
    private final String clientSecret = "cRub2eyqIG";
    private final String redirectUri = "http://localhost:8888/myapp/auth/login/naver";

    //        String clientSecret = "F5BCjIhXHv"; // 실제 클라이언트 시크릿으로 교체

    public NaverAuthService(UserService userService, RestTemplate restTemplate, HttpSession httpSession) {
        super(userService, restTemplate, httpSession);
    }

    @Override
    protected String getTokenUrl() {
        return "https://nid.naver.com/oauth2.0/token";
    }

    @Override
    protected String getUserInfoUrl() {
        return "https://openapi.naver.com/v1/nid/me";
    }

    @Override
    protected MultiValueMap<String, String> getTokenRequestParameters(String code) {
        MultiValueMap<String, String> parameters = new LinkedMultiValueMap<>();
        parameters.add("grant_type", "authorization_code");
        parameters.add("client_id", clientId);
        parameters.add("client_secret", clientSecret);
        parameters.add("redirect_uri", redirectUri);
        parameters.add("code", code);
        return parameters;
    }

    @Override
    protected HttpHeaders getUserInfoHeaders(String accessToken) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", "Bearer " + accessToken);
        return headers;
    }

    @Override
    public String getAuthUrl() {
        return "https://nid.naver.com/oauth2.0/authorize"
                + "?client_id=" + clientId
                + "&redirect_uri=" + redirectUri
                + "&response_type=code";
    }
}

