//package com.yorizip.myapp.user.controller;
//
//import com.yorizip.myapp.user.vo.UserVO;
//import com.yorizip.myapp.user.service.UserServiceTemp;
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.*;
//
//import javax.servlet.http.HttpSession;
//import java.util.Map;
//
//@Controller
//public class AuthController {
//
//    private final UserServiceTemp userServiceTemp;
//    private static final Logger log = LoggerFactory.getLogger(AuthController.class);
//
//    public AuthController(UserServiceTemp userServiceTemp) {
//        this.userServiceTemp = userServiceTemp;
//    }
//
//    @PostMapping("/user/register")
//    public String registerUser(@RequestParam String userName,
//                               @RequestParam String userId,
//                               @RequestParam String password,
//                               @RequestParam String passwordConfirm,
//                               @RequestParam String nickname,
//                               @RequestParam String userEmail,
//                               @RequestParam String phone,
//                               @RequestParam(required = false) boolean marketingAgree,
//                               @RequestParam boolean privacyAgree,
//                               Model model,
//                               HttpSession session) {
//        if (!password.equals(passwordConfirm)) {
//            log.info("%%%%%%%%%%%%%%%%");
//            model.addAttribute("error", "비밀번호가 일치하지 않습니다.");
//            return "redirect:/myapp/join/joinKakao.jsp";
//        }
//
//        Map<String, Object> userInfo = (Map<String, Object>) session.getAttribute("userInfo");
//
//        if (userInfo.containsKey("properties")) {
//            // 카카오 사용자 정보 처리
//            Map<String, Object> properties = (Map<String, Object>) userInfo.get("properties");
//            String profileImgUrl = (String) properties.get("profile_image");
//            String socialPlatform = "Kakao";
//            log.info("Profile Image URL: {}", profileImgUrl);
//            UserVO user = userServiceTemp.registerUser(userName, password, nickname, userEmail, phone, profileImgUrl, socialPlatform);
//            log.info("UserVO : {}", user);
//        } else if (userInfo.containsKey("response")) {
//            // 네이버 사용자 정보 처리
//            Map<String, Object> response = (Map<String, Object>) userInfo.get("response");
//            String profileImgUrl = (String) response.get("profile_image");
//            String socialPlatform = "Naver";
//            log.info("Profile Image URL: {}", profileImgUrl);
//            UserVO user = userServiceTemp.registerUser(userName, password, nickname, userEmail, phone, profileImgUrl, socialPlatform);
//            log.info("UserVO : {}", user);
//        }
//        return "redirect:/login/login.jsp";
//    }
//
//    @PostMapping("/user/register/no")
//    public String registerUserNo(@RequestParam String userName,
//                               @RequestParam String userId,
//                               @RequestParam String password,
//                               @RequestParam String passwordConfirm,
//                               @RequestParam String nickname,
//                               @RequestParam String userEmail,
//                               @RequestParam String phone,
//                               @RequestParam(required = false) boolean marketingAgree,
//                               @RequestParam boolean privacyAgree,
//                               Model model,
//                               HttpSession session) {
//        log.info("%%%%%%%%%%%%%%%%");
//        if (!password.equals(passwordConfirm)) {
//            log.info("%%%%%%%%%%%%%%%%");
//            model.addAttribute("error", "비밀번호가 일치하지 않습니다.");
//            return "redirect:/myapp/join/join.jsp";
//        }
//
//        UserVO user = userServiceTemp.registerUserNo(userName, password, nickname, userEmail, phone);
//
//        return "redirect:/login/login.jsp";
//    }
//
//    @GetMapping("/auth/login")
//    public String login(HttpSession session, @RequestParam String email, @RequestParam String password) {
//        try {
//            UserVO user = userServiceTemp.getUserByEmailLogin(email);
//            Long userId = userServiceTemp.getUserIdByEmail(email).getId();
//            session.setAttribute("user", user);
//            session.setAttribute("userId", userId);
//            log.info("user has been stored in session: {}", session.getAttribute("user"));
//            log.info("user has been stored in session: {}", email);
//
//            if (user.getUserEmail() != email) {
//                // 비밀번호 검증 추가해야함
//                return "redirect:/main/main.jsp";
//            }
//            session.setAttribute("user", user);
//            session.setAttribute("userId", userId);
//            return "redirect:/join/join.jsp";
//        } catch (Exception e) {
//            e.printStackTrace();
//            return "redirect:/login-error"; // 에러 페이지로 리다이렉트
//        }
//    }
//
//
//    @GetMapping("/mypage")
//    public String myPage(HttpSession session, Model model) {
//        Map<String, Object> userInfo = (Map<String, Object>) session.getAttribute("userInfo");
//
//        model.addAttribute("user", userInfo);
//
//        return "redirect:/mypage/mypage_userinfo.jsp";
//    }
//
//
//    @GetMapping("/auth/kakao")
//    public String kakaoAuth() {
//        String clientId = "920865d3fcdbfd024c9e2f35b102beb6"; // 실제 클라이언트 ID로 교체
//        String redirectUri = "http://localhost:8888/myapp/auth/login/kakao";
//        String kakaoAuthUrl = "https://kauth.kakao.com/oauth/authorize"
//                + "?client_id=" + clientId
//                + "&redirect_uri=" + redirectUri
//                + "&response_type=code";
//        return "redirect:" + kakaoAuthUrl;
//    }
//
//    @GetMapping("/auth/naver")
//    public String naverAuth() {
//        String clientId = "tsCjaf_Sguy3on43jxmt"; // 실제 클라이언트 ID로 교체
//        String redirectUri = "http://localhost:8888/myapp/auth/login/naver"; // 실제 리다이렉트 URI로 교체
//        String state = ""; // 실제 상태 값으로 교체
//
//        String naverAuthUrl = "https://nid.naver.com/oauth2.0/authorize"
//                + "?response_type=code"
//                + "&client_id=" + clientId
//                + "&redirect_uri=" + redirectUri
//                + "&state=" + state;
//
//        return "redirect:" + naverAuthUrl;
//    }
//
//    @GetMapping("/auth/login/kakao")
//    public String kakaoLogin(@RequestParam String code, HttpSession session) {
//        try {
//            String accessToken = userServiceTemp.getKakaoAccessToken(code);
//
//            log.info("$$$$$$$$$$$accessToken = {}", accessToken);
//            Map<String, Object> userInfo = userServiceTemp.getKakaoUserInfo(accessToken);
//            log.info("$$$$$$$$$$$accessToken = {}", userInfo);
//
//            Map<String, Object> kakaoAccount = (Map<String, Object>) userInfo.get("kakao_account");
//            log.info("$$$$$$$$$$$accessToken = {}", kakaoAccount);
//
//            String email = (String) kakaoAccount.get("email");
//            log.info("$$$$$$$$$$$accessToken = {}", email);
//
//            UserVO user = userServiceTemp.getUserByEmail(email);
//            log.info("$$$$$$$$$$$accessToken = {}", user);
//
//            Long userId = userServiceTemp.getUserIdByEmail(email).getId();
//            log.info("$$$$$$$$$$$%%%%%%%%%%%%%%%%% = {}", userId);
//
//            log.info("$$$$$$$$$$$accessToken = {}", user);
//
//            Boolean isUser = userServiceTemp.handleKakaoUser(userInfo);
//            session.setAttribute("userInfo", userInfo);
//            session.setAttribute("user", user);
//            session.setAttribute("userId", userId);
//            log.info("$$$$$$$$$$$accessToken = {}", isUser);
//
//            log.info("user has been stored in session: {}", session.getAttribute("user"));
//            log.info("userInfo has been stored in session: {}", session.getAttribute("userInfo"));
//
//            if (!isUser) {
//                log.info("##################1111");
//                return "redirect:/join/joinKakao.jsp";
//            }
//            session.setAttribute("user", user);
//            return "redirect:/main/main.jsp";
//        } catch (Exception e) {
//            e.printStackTrace();
//            return "redirect:/join/join.jsp"; // 에러 페이지로 리다이렉트
//        }
//    }
//
//    @GetMapping("/auth/login/naver")
//    public String naverLogin(@RequestParam String code, HttpSession session) {
//        try {
//            String accessToken = userServiceTemp.getNaverAccessToken(code);
//            log.info("$$$$$$$$$$$accessToken = {}", accessToken);
//
//
//            Map<String, Object> userInfo = userServiceTemp.getNaverUserInfo(accessToken);
//            log.info("$$$$$$$$$$$accessToken = {}", userInfo);
//
//            Map<String, Object> response = (Map<String, Object>) userInfo.get("response");
//            log.info("$$$$$$$$$$$accessToken = {}", response);
//
//            String email = (String) response.get("email");
//            log.info("$$$$$$$$$$$accessToken = {}", email);
//
//            UserVO user = userServiceTemp.getUserByEmail(email);
//            log.info("$$$$$$$$$$$accessToken = {}", user);
//
//            Long userId = userServiceTemp.getUserIdByEmail(email).getId();
//            log.info("$$$$$$$$$$$accessToken = {}", user);
//
//            Boolean isUser = userServiceTemp.handleNaverUser(userInfo);
//            session.setAttribute("userInfo", userInfo);
//            session.setAttribute("user", user);
//            session.setAttribute("userId", userId);
//            log.info("user has been stored in session: {}", session.getAttribute("user"));
//            log.info("userInfo has been stored in session: {}", session.getAttribute("userInfo"));
//
//            if (!isUser) {
//                log.info("User is not registered, redirecting to join page");
//                return "redirect:/join/joinKakao.jsp";
//            }
//
//            return "redirect:/main/main.jsp";
//        } catch (Exception e) {
//            e.printStackTrace();
//            return "redirect:/login-error";
//        }
//    }
//
//
//    @PostMapping("/mypage/verify-password")
//    public String verifyPassword(@RequestParam("password") String password, HttpSession session, Model model) {
//
//        Map<String, Object> userInfo = (Map<String, Object>) session.getAttribute("userInfo");
//
//        UserVO user = (UserVO) session.getAttribute("user");
//
//        String email = (String) ((Map<String, Object>) userInfo.get("kakao_account")).get("email");
//
//        boolean isPasswordValid = userServiceTemp.checkPassword(user.getUserEmail(), password);
//
//        if (isPasswordValid) {
//            return "redirect:/mypage/mypage_userinfo_next.jsp";
//        } else {
//            model.addAttribute("error", "비밀번호가 일치하지 않습니다.");
//            return "redirect:/mypage/mypage_userinfo";
//        }
//    }
//
//    @PostMapping("/mypage/update-userinfo")
//    public String updateUserInfo(@RequestParam String userName,
//                                 @RequestParam String nickname,
//                                 @RequestParam String password,
//                                 @RequestParam String passwordConfirm,
//                                 @RequestParam String userEmail,
//                                 @RequestParam(required = false) String profileImgUrl,
//                                 Model model, HttpSession session) {
//        if (!password.equals(passwordConfirm)) {
//            model.addAttribute("error", "비밀번호가 일치하지 않습니다.");
//            return "redirect:mypage/mypage_userinfo_next";
//        }
//
//        Map<String, Object> userInfo = (Map<String, Object>) session.getAttribute("userInfo");
//
//        String email = (String) ((Map<String, Object>) userInfo.get("kakao_account")).get("email");
//
//        UserVO user = userServiceTemp.updateUser(userName, nickname, password, profileImgUrl, email);
//
//        session.setAttribute("user", user);
//
//        // 성공 시 마이페이지로 리다이렉트
//        return "redirect:/mypage";
//    }
//}
