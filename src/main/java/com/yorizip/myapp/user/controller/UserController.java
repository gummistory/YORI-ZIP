package com.yorizip.myapp.user.controller;

import com.yorizip.myapp.user.dto.request.UserRegisterRequestDto;
import com.yorizip.myapp.user.service.UserService;
import com.yorizip.myapp.user.vo.UserVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.Map;

@Controller
@RequiredArgsConstructor
@Slf4j
public class UserController {
    private final UserService userService;

    @PostMapping("/user/register")
    public String registerUser(@ModelAttribute UserRegisterRequestDto dto) {
        log.info("UserController.registerUser + {}", dto);
        // TODO: 서비스레이어로 메서드 빼놓기, 서비스레이어 익셉션핸들러 구현
        if (!dto.getPassword().equals(dto.getPasswordConfirm())) {
            log.info("비밀번호가 일치하지 않습니다 + {}", dto);
            return "redirect:/join/joinKakao.jsp";
        }

        log.info("UserController.registerUser userService.registerUser + {}", dto);
        userService.registerUser(dto);
        return "redirect:/login/login.jsp";
    }

    @GetMapping("/mypage")
    public String myPage(HttpSession session, Model model) {
        Map<String, Object> userInfo = (Map<String, Object>) session.getAttribute("userInfo");
        model.addAttribute("user", userInfo);
        return "redirect:/mypage/mypage_userinfo.jsp";
    }

    @PostMapping("/mypage/verify-password")
    public String verifyPassword(@RequestParam("password") String password, HttpSession session, Model model) {

        Map<String, Object> userInfo = (Map<String, Object>) session.getAttribute("userInfo");

        UserVO user = (UserVO) session.getAttribute("user");
        boolean isPasswordValid = userService.checkPassword(user.getUserEmail(), password);

        if (isPasswordValid) {
            return "redirect:/mypage/mypage_userinfo_next.jsp";
        } else {
            model.addAttribute("error", "비밀번호가 일치하지 않습니다.");
            return "redirect:/mypage/mypage_userinfo";
        }
    }

    @PostMapping("/mypage/update-userinfo")
    public String updateUserInfo(@RequestParam String userName,
                                 @RequestParam String nickname,
                                 @RequestParam String password,
                                 @RequestParam String passwordConfirm,
                                 @RequestParam String userEmail,
                                 @RequestParam(required = false) String profileImgUrl,
                                 Model model, HttpSession session) {
        if (!password.equals(passwordConfirm)) {
            model.addAttribute("error", "비밀번호가 일치하지 않습니다.");
            return "redirect:mypage/mypage_userinfo_next";
        }

        UserVO loginUser = (UserVO) session.getAttribute("user");
        UserVO user = userService.updateUser(userName, nickname, password, profileImgUrl, loginUser.getUserEmail());

        session.setAttribute("user", user);

        // 성공 시 마이페이지로 리다이렉트
        return "redirect:/mypage";
    }

    @PostMapping("/user/register/no")
    public String registerUserNo(@ModelAttribute UserRegisterRequestDto dto) {
        log.info("UserController.registerUser + {}", dto);
        // TODO: 서비스레이어로 메서드 빼놓기, 서비스레이어 익셉션핸들러 구현
        if (!dto.getPassword().equals(dto.getPasswordConfirm())) {
            log.info("비밀번호가 일치하지 않습니다 + {}", dto);
            return "redirect:/join/join.jsp";
        }

        log.info("UserController.registerUser userService.registerUser + {}", dto);
        userService.registerUserNo(dto);
        return "redirect:/login/login.jsp";
    }
}
