package com.yorizip.myapp.user.service;

import com.yorizip.myapp.user.dto.request.UserRegisterRequestDto;
import com.yorizip.myapp.user.mapper.UserMapper;
import com.yorizip.myapp.user.vo.UserVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpSession;
import java.util.Map;

@Service
@Slf4j
@RequiredArgsConstructor
public class UserService {
    private final UserMapper userMapper;
    private final HttpSession httpSession;

    public UserVO findUserByEmail(String email) {
        return userMapper.getUserByEmail(email);
    }

    public void registerUser(UserRegisterRequestDto userDto) {
        log.info("UserService.registerUser + {}", userDto);
        String hashedPassword = BCrypt.hashpw(userDto.getPassword(), BCrypt.gensalt());
        userDto.setPassword(hashedPassword);
        Map<String, Object> userInfo = (Map<String, Object>) httpSession.getAttribute("userInfo");
        log.info("UserService.registerUser userInfo + {}", userInfo);


        // 카카오 authProviderID = 1
        if (userInfo.containsKey("properties")) {
            Map<String, Object> properties = (Map<String, Object>) userInfo.get("properties");
            userMapper.insertUser(
                    UserVO.createUser(userDto,
                            (String) properties.get("profile_image"),
                            1));
        }

        // 네이버 authProviderId = 2
        else if (userInfo.containsKey("response")) {
            Map<String, Object> response = (Map<String, Object>) userInfo.get("response");
            userMapper.insertUser(UserVO.createUser(
                    userDto,
                    (String) response.get("profile_image"),
                    2));
        }
    }

    public void registerUserNo(UserRegisterRequestDto userDto) {
        log.info("UserService.registerUser + {}", userDto);
        String hashedPassword = BCrypt.hashpw(userDto.getPassword(), BCrypt.gensalt());
        userDto.setPassword(hashedPassword);
        Map<String, Object> userInfo = (Map<String, Object>) httpSession.getAttribute("userInfo");
        log.info("UserService.registerUser userInfo + {}", userInfo);

        userMapper.insertUser(UserVO.createUser(userDto,"test", 1));
    }

    public boolean checkPassword(String email, String rawPassword) {
        UserVO user = userMapper.getUserByEmail(email);
        log.info("Received userVO: {}", user);
        if (user != null) {
            return BCrypt.checkpw(rawPassword, user.getHashedPassword());
        }
        return false;
    }

    @Transactional
    public UserVO updateUser(String userName, String nickname, String password, String profileImgUrl, String userEmail) {
        log.info("Received 1: {}", userName);

        // 비밀번호 해싱 처리
        String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());
        log.info("Hashed Password: {}", hashedPassword);

        // 빌더 패턴을 사용해 UserVO 객체 생성 및 업데이트
        UserVO user = UserVO.builder()
                .userName(userName)
                .nickname(nickname)
                .hashedPassword(hashedPassword)
                .profileImgUrl(profileImgUrl)
                .userEmail(userEmail)
                .build();

        log.info("User to update: {}", user);

        userMapper.updateUser(user);
        UserVO returnUser = userMapper.getUserByEmail(user.getUserEmail());
        log.info("Updated user: {}", user.getUserName());
        return returnUser;
    }
}
