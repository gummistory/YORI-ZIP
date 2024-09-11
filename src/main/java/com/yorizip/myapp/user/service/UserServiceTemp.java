//package com.yorizip.myapp.user.service;
//
//import com.yorizip.myapp.user.mapper.UserMapper;
//import com.yorizip.myapp.user.vo.AuthProviderVO;
//import com.yorizip.myapp.user.vo.SocialLoginVO;
//import com.yorizip.myapp.user.vo.UserVO;
//import org.mindrot.jbcrypt.BCrypt;
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//import org.springframework.http.*;
//import org.springframework.stereotype.Service;
//import org.springframework.transaction.annotation.Transactional;
//import org.springframework.util.LinkedMultiValueMap;
//import org.springframework.util.MultiValueMap;
//import org.springframework.web.client.RestTemplate;
//
//import java.util.Map;
//
//@Service
//public class UserServiceTemp {
//    private final UserMapper userMapper;
//    private static final Logger logger = LoggerFactory.getLogger(UserServiceTemp.class);
//
//    @Transactional
//    public Long saveUser(UserVO user) {
//        userMapper.insertUser(user);
//        return user.getUserId();
//    }
//
//    private boolean isEmailExists(String email) {
//        return userMapper.getUserByEmail(email) != null;
//    }
//
//    @Transactional
//    public void saveSocialLogin(SocialLoginVO socialLogin) {
//        // 소셜 로그인 정보 저장 로직 구현
//        userMapper.insertSocialLogin(socialLogin);
//    }
//
//    @Transactional
//    public void saveAuthProvider(AuthProviderVO authProvider) {
//        // 인증 제공자 정보 저장 또는 업데이트 로직 구현
//        userMapper.insertAuthProvider(authProvider);
//    }
//
//    public UserVO getUserByEmail(String email) {
//       return userMapper.getUserByEmail(email);
//    }
//
//    public UserVO getUserIdByEmail(String email) {
//        return userMapper.getUserIdByEmail(email);
//    }
//
//    public UserVO getUserByEmailLogin(String email) {
//        return userMapper.getUserByEmailLogin(email);
//    }
//
//    public void registerUser(UserVO user) {
//        // 비밀번호 암호화
//        String hashedPassword = BCrypt.hashpw(user.getHashedPassword(), BCrypt.gensalt());
//        user.setHashedPassword(hashedPassword);
//
//        logger.info("##############pppppppppp ={}", user.getUserName());
//        logger.info("##############pppppppppp ={}", user.getNickname());
//        logger.info("##############pppppppppp ={}", user.getUserEmail());
//
//        // 사용자 데이터베이스에 저장
//        userMapper.insertUser(user);
//    }
//
//    public boolean checkPassword(String email, String rawPassword) {
//        // 이메일을 기준으로 데이터베이스에서 사용자 정보를 조회
//        UserVO user = userMapper.getUserByEmail(email);
//        logger.info("Received userVO: {}", user);
//
//        if (user != null) {
//            // 저장된 해시된 비밀번호와 사용자가 입력한 비밀번호를 비교
//            return BCrypt.checkpw(rawPassword, user.getHashedPassword());
//        }
//
//        return false;
//    }
//
//
//    private final RestTemplate restTemplate;
//
//    public UserServiceTemp(UserMapper userMapper, SocialLoginMapper socialLoginMapper, AuthProviderMapper authProviderMapper, RestTemplate restTemplate) {
//        this.userMapper = userMapper;
//        this.socialLoginMapper = socialLoginMapper;
//        this.authProviderMapper = authProviderMapper;
//        this.restTemplate = restTemplate;
//    }
//
//    public String getKakaoAccessToken(String code) {
//        String clientId = "920865d3fcdbfd024c9e2f35b102beb6";
//        String redirectUri = "http://localhost:8888/myapp/auth/login/kakao";
//
//        // 액세스 토큰 요청
//        String tokenUrl = "https://kauth.kakao.com/oauth/token";
//        MultiValueMap<String, String> parameters = new LinkedMultiValueMap<>();
//        parameters.add("grant_type", "authorization_code");
//        parameters.add("client_id", clientId);
//        parameters.add("redirect_uri", redirectUri);
//        parameters.add("code", code);
//
//        HttpHeaders headers = new HttpHeaders();
//        headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);
//
//        HttpEntity<MultiValueMap<String, String>> request = new HttpEntity<>(parameters, headers);
//
//        ResponseEntity<Map> response = restTemplate.postForEntity(tokenUrl, request, Map.class);
//
//        Map<String, Object> responseBody = response.getBody();
//        return (String) responseBody.get("access_token");
//    }
//
//    public String getNaverAccessToken(String code) {
//        String clientId = "tsCjaf_Sguy3on43jxmt"; // 실제 클라이언트 ID로 교체
//        String clientSecret = "F5BCjIhXHv"; // 실제 클라이언트 시크릿으로 교체
//        String redirectUri = "http://localhost:8888/myapp/auth/login/naver"; // 실제 리다이렉트 URI로 교체
//
//        // 액세스 토큰 요청
//        String tokenUrl = "https://nid.naver.com/oauth2.0/token";
//        MultiValueMap<String, String> parameters = new LinkedMultiValueMap<>();
//        parameters.add("grant_type", "authorization_code");
//        parameters.add("client_id", clientId);
//        parameters.add("client_secret", clientSecret);
//        parameters.add("redirect_uri", redirectUri);
//        parameters.add("code", code);
//
//        HttpHeaders headers = new HttpHeaders();
//        headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);
//
//        HttpEntity<MultiValueMap<String, String>> request = new HttpEntity<>(parameters, headers);
//
//        ResponseEntity<Map> response = restTemplate.postForEntity(tokenUrl, request, Map.class);
//
//        Map<String, Object> responseBody = response.getBody();
//        return (String) responseBody.get("access_token");
//    }
//
//    public Map<String, Object> getKakaoUserInfo(String accessToken) {
//        // 사용자 정보 요청
//        String userInfoUrl = "https://kapi.kakao.com/v2/user/me";
//        HttpHeaders headers = new HttpHeaders();
//        headers.add("Authorization", "Bearer " + accessToken);
//
//        HttpEntity<String> request = new HttpEntity<>(headers);
//        ResponseEntity<Map> response = restTemplate.exchange(userInfoUrl, HttpMethod.GET, request, Map.class);
//
//        return response.getBody();
//    }
//
//    public Map<String, Object> getNaverUserInfo(String accessToken) {
//        // 사용자 정보 요청
//        String userInfoUrl = "https://openapi.naver.com/v1/nid/me";
//        HttpHeaders headers = new HttpHeaders();
//        headers.add("Authorization", "Bearer " + accessToken);
//
//        HttpEntity<String> request = new HttpEntity<>(headers);
//        ResponseEntity<Map> response = restTemplate.exchange(userInfoUrl, HttpMethod.GET, request, Map.class);
//
//        return response.getBody();
//    }
//
//
//
//    @Transactional
//    public Boolean handleKakaoUser(Map<String, Object> userInfo) {
//        try {
//            // 카카오 계정 정보 추출
//            Map<String, Object> kakaoAccount = (Map<String, Object>) userInfo.get("kakao_account");
//            String email = (String) kakaoAccount.get("email");
//            String nickname = (String) ((Map<String, Object>) kakaoAccount.get("profile")).get("nickname");
//            String phoneNumber = (String) kakaoAccount.get("phone_number");  // 전화번호는 선택적
//            String profileImgUrl = (String) ((Map<String, Object>) kakaoAccount.get("profile")).get("profile_image_url");
//
//            logger.info("Kakao account details: {}", kakaoAccount);
//            logger.info("Nickname: {}", nickname);
//            logger.info("Email: {}", email);
//            logger.info("Profile image URL: {}", profileImgUrl);
//
//            // 중복 이메일 체크
//            if (isEmailExists(email)) {
//                logger.info("truueeeeeeeeeeeeee");
//                return true;
//            } else {
//                return false;
//            }
//
//        } catch (Exception e) {
//            logger.error("Error processing Kakao user information", e);
//            throw new RuntimeException("사용자 정보 처리 중 오류 발생", e);
//        }
//    }
//
//    @Transactional
//    public Boolean handleNaverUser(Map<String, Object> userInfo) {
//        try {
//            // 네이버 계정 정보 추출
//            Map<String, Object> response = (Map<String, Object>) userInfo.get("response");
//            String email = (String) response.get("email");
//            String nickname = (String) response.get("nickname"); // 선택적 필드
//            String profileImgUrl = (String) response.get("profile_image"); // 선택적 필드
//            String id = (String) response.get("id"); // 네이버 고유 ID
//
//            logger.info("Naver account details: {}", response);
//            logger.info("Nickname: {}", nickname);
//            logger.info("Email: {}", email);
//            logger.info("Profile image URL: {}", profileImgUrl);
//
//            // 중복 이메일 체크
//            if (isEmailExists(email)) {
//                logger.info("Email already exists");
//                return true; // 사용자가 이미 존재함
//            } else {
//                // 새로운 사용자 등록 로직을 추가할 수 있음
//                logger.info("Email does not exist, user needs to be registered");
//                return false; // 새로운 사용자임
//            }
//
//        } catch (Exception e) {
//            logger.error("Error processing Naver user information", e);
//            throw new RuntimeException("사용자 정보 처리 중 오류 발생", e);
//        }
//    }
//
//
//    @Transactional
//    public UserVO registerUser(String userName, String password, String nickname, String userEmail, String phone, String profileImgUrl, String socialPlatform) {
//        logger.info("Received 1: {}", userName);
//        logger.info("YEEEEEEEEEEEEEEEEEEES", userName);
//
//
//        // 비밀번호 해싱 처리 (예: BCrypt)
//        String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());
//        logger.info("Received 2: {}", password);
//
//        // 사용자 객체 생성
//        UserVO user = new UserVO(userName, nickname, hashedPassword, phone, userEmail, 1, profileImgUrl);
//        logger.info("Received 3: {}", user);
//
//        // User 정보 저장
//        userMapper.insertUser(user);
//        Long userId = user.getUserId(); // DB에 저장된 후, 생성된 userId를 가져옴
//        logger.info("Received 4: {}", userEmail);
//
//        // 소셜 로그인 정보 처리
//        SocialLoginVO socialLogin = new SocialLoginVO(0, socialPlatform, nickname, "access_token_here", userId);
//        saveSocialLogin(socialLogin); // 데이터베이스에 소셜 로그인 정보 저장
//        logger.info("Received 5: {}", profileImgUrl);
//
//        // 인증 제공자 정보 처리
//        AuthProviderVO authProvider = new AuthProviderVO(1, socialPlatform, "Social");
//        saveAuthProvider(authProvider); // 데이터베이스에 인증 제공자 정보 저장 또는 업데이트
//
//        return user;
//    }
//
//    @Transactional
//    public UserVO registerUserNo(String userName, String password, String nickname, String userEmail, String phone) {
//        logger.info("Registering user - Input parameters:");
//        logger.info("userName: {}", userName);
//        logger.info("password: {}", password);
//        logger.info("nickname: {}", nickname);
//        logger.info("userEmail: {}", userEmail);
//        logger.info("phone: {}", phone);
//
//
//        // 비밀번호 해싱 처리 (예: BCrypt)
//        String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());
//        logger.info("Password hashed successfully");
//        logger.info("password: {}", hashedPassword);
//
//        // 사용자 객체 생성
//        UserVO user = new UserVO(userName, nickname, hashedPassword, phone, userEmail);
//        logger.info("UserVO object created: {}", user);
//
//        // User 정보 저장
//        userMapper.insertUser(user);
//        Long userId = user.getUserId(); // DB에 저장된 후, 생성된 userId를 가져옴
//        logger.info("Received 4: {}", userEmail);
//
//        return user;
//    }
//
//    @Transactional
//    public UserVO updateUser(String userName, String nickname, String password, String profileImgUrl, String userEmail) {
//        logger.info("Received 1: {}", userName);
//
//        // 비밀번호 해싱 처리
//        String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());
//        logger.info("Received 1: {}", hashedPassword);
//
//        // 사용자 정보 생성 및 업데이트
//        UserVO user = new UserVO();
//        user.setUserName(userName);
//        user.setNickname(nickname);
//        user.setHashedPassword(hashedPassword);
//        user.setProfileImgUrl(profileImgUrl);
//        user.setUserEmail(userEmail);
//        logger.info("Received 1: {}", user);
//
//        userMapper.updateUser(user);
//        logger.info("Received 1: {}", user.getUserName());
//        return user;
//    }
//}
