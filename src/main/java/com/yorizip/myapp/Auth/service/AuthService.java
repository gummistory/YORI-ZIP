package com.yorizip.myapp.Auth.service;

import com.yorizip.myapp.user.service.UserService;
import com.yorizip.myapp.user.vo.UserVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.*;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import javax.servlet.http.HttpSession;
import java.util.Map;
import java.util.Optional;

@Service
@RequiredArgsConstructor
@Slf4j
public class AuthService {
    private final UserService userService;
    private final RestTemplate restTemplate;
    private final HttpSession httpSession;
    private final KakaoAuthService kakaoAuthService;
    private final NaverAuthService naverAuthService;

    public String getKakaoAuthUrl() {
        String clientId = "702ef8fdedc106e5f694e13bbe7538e1";
        String redirectUri = "http://localhost:8888/myapp/auth/login/kakao";

        return "https://kauth.kakao.com/oauth/authorize"
                + "?client_id=" + clientId
                + "&redirect_uri=" + redirectUri
                + "&response_type=code";
    }

    public String getNaverAuthUrl() {
        String clientId = "8njUNhQJZagPjfuWz7OM";
        String redirectUri = "http://localhost:8888/myapp/auth/login/naver";
        String state = "";

        return "https://nid.naver.com/oauth2.0/authorize"
                + "?response_type=code"
                + "&client_id=" + clientId
                + "&redirect_uri=" + redirectUri
                + "&state=" + state;
    }

    public Boolean processLogin(String code, String provider) {
        log.info("Starting login process for provider: {}", provider);

        OAuthService oauthService;
        if ("kakao".equalsIgnoreCase(provider)) {
            oauthService = kakaoAuthService;
        } else if ("naver".equalsIgnoreCase(provider)) {
            oauthService = naverAuthService;
        } else {
            log.error("Unsupported provider: {}", provider);
            throw new IllegalArgumentException("Unsupported provider: " + provider);
        }

        log.info("Getting access token from provider: {}", provider);
        String accessToken = oauthService.getAccessToken(code);
        log.info("Received access token: {}", accessToken);

        log.info("Fetching user info from provider: {}", provider);
        Map<String, Object> userInfo = oauthService.getUserInfo(accessToken);
        httpSession.setAttribute("userInfo", userInfo);
        log.info("Received user info: {}", userInfo);

        boolean isUserHandled = oauthService.handleUser(userInfo, provider);
        log.info("User handling result: {}", isUserHandled);

        if (isUserHandled) {
            String email = null;

            // 카카오의 경우
            if ("kakao".equalsIgnoreCase(provider)) {
                email = (String) ((Map<String, Object>) userInfo.get("kakao_account")).get("email");
            }
            // 네이버의 경우
            else if ("naver".equalsIgnoreCase(provider)) {
                email = (String) ((Map<String, Object>) userInfo.get("response")).get("email");
            }

            if (email != null) {
                UserVO userVO = userService.findUserByEmail(email);
                if (userVO != null) {
                    httpSession.setAttribute("user", userVO); // 세션에 UserVO 저장
                    log.info("User stored in session: {}", userVO);
                    return true;
                } else {
                    log.error("User not found with email: {}", email);
                }
            } else {
                log.error("Failed to retrieve email from userInfo for provider: {}", provider);
            }
        }

        return false;
    }
}