package com.yorizip.myapp.Auth.controller;

import com.yorizip.myapp.Auth.service.AuthService;
import com.yorizip.myapp.user.service.UserService;
import com.yorizip.myapp.user.vo.UserVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequiredArgsConstructor
@Slf4j
public class AuthController {
    private final AuthService authService;
    private final UserService userService;

    @GetMapping("/auth/kakao")
    public String kakaoAuth() {
        return "redirect:" + authService.getKakaoAuthUrl();
    }

    @GetMapping("/auth/login/kakao")
    public String kakaoLogin(@RequestParam String code) {
        log.info("Received Kakao login request with code: {}", code);

        boolean isUserExists = authService.processLogin(code, "kakao");

        if (isUserExists) {
            log.info("User exists, redirecting to main page");
            return "redirect:/main/main.jsp";
        } else {
            log.info("User does not exist, redirecting to join page");
            return "redirect:/join/joinKakao.jsp";
        }
    }


    @GetMapping("/auth/naver")
    public String naverAuth() {
        return "redirect:" + authService.getNaverAuthUrl();
    }

    @GetMapping("/auth/login/naver")
    public String naverLogin(@RequestParam String code) {
        return authService.processLogin(code, "naver")
                ? "redirect:/main/main.jsp" // 가입된 회원이 존재할 경우
                : "redirect:/join/joinKakao.jsp"; // 가입된 회원이 없을 경우
    }

    @GetMapping("/auth/login")
    public String login(HttpSession session, @RequestParam String email, @RequestParam String password, Model model) {
        try {
            UserVO user = userService.findUserByEmail(email);

            if (user == null || !user.getHashedPassword().equals(password)) {
                // 비밀번호가 일치하지 않거나 사용자가 존재하지 않는 경우
                model.addAttribute("loginError", "아이디 또는 비밀번호가 일치하지 않습니다.");
                return "login/homepageLogin"; // 로그인 페이지로 이동
            }
            
            // 로그인 성공 시 세션에 사용자 정보 저장
            Long userId = user.getId();
            session.setAttribute("user", user);
            session.setAttribute("userId", userId);
            log.info("user has been stored in session: {}", session.getAttribute("user"));
            log.info("user has been stored in session: {}", email);

            // 메인 페이지로 리다이렉트
            return "redirect:/main/main";
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("loginError", "로그인 중 오류가 발생했습니다. 다시 시도해주세요.");
            return "login/homepageLogin"; // 로그인 페이지로 이동
        }
    }




    

    @GetMapping("/auth/logout")
    public String logout(HttpServletRequest request) {
        try {
            HttpSession session = request.getSession(false); // 세션이 있을 경우에만 가져옴
            if (session != null) {
                session.invalidate(); // 세션 무효화
                log.info("User logged out, session invalidated");
            }
        } catch (Exception e) {
            log.error("Error during logout process: ", e); // 예외 발생 시 오류 로그 출력
            return "redirect:/error.jsp"; // 에러 발생 시 에러 페이지로 리다이렉트
        }
        return "redirect:/main/main.jsp"; // 정상 로그아웃 후 로그인 페이지로 리다이렉트
    }

}
