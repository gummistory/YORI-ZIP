package com.yorizip.myapp.Auth.service;

import java.util.Map;

public interface OAuthService {
    String getAccessToken(String code);
    Map<String, Object> getUserInfo(String accessToken);
    Boolean handleUser(Map<String, Object> userInfo, String provider);
    String getAuthUrl();
}

