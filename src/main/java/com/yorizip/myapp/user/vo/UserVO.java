package com.yorizip.myapp.user.vo;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.yorizip.myapp.user.dto.request.UserRegisterRequestDto;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@JsonIgnoreProperties(ignoreUnknown = true)
public class UserVO {
    private Long id;
    private String userName;
    private String userId;
    private String nickname;
    private String hashedPassword;
    private String phone;
    private String userEmail;
    private int authProviderID; // 인증 제공자 ID
    private String profileImgUrl;

    public UserVO(String userName, String userId, String nickname, String hashedPassword, String phone, String userEmail, int authProviderID, String profileImgUrl) {
        this.userName = userName;
        this.userId = userId;
        this.nickname = nickname;
        this.hashedPassword = hashedPassword;
        this.phone = phone;
        this.userEmail = userEmail;
        this.authProviderID = authProviderID;
        this.profileImgUrl = profileImgUrl;
    }

    public UserVO(String userName, String userId, String nickname, String hashedPassword, String phone, String userEmail) {
        this.userName = userName;
        this.userId = userId;
        this.nickname = nickname;
        this.hashedPassword = hashedPassword;
        this.phone = phone;
        this.userEmail = userEmail;
    }

    public static UserVO createUser(UserRegisterRequestDto dto,
                                    String profileImgUrl,
                                    int authProviderID) {
        return UserVO.builder()
                .userName(dto.getUserName())
                .userId(dto.getUserId())
                .nickname(dto.getNickname())
                .hashedPassword(dto.getPassword())
                .phone(dto.getPhone())
                .userEmail(dto.getUserEmail())
                .authProviderID(authProviderID)
                .profileImgUrl(profileImgUrl)
                .build();
    }

    public static UserVO createUserNo(UserRegisterRequestDto dto) {
        return UserVO.builder()
                .userName(dto.getUserName())
                .userId(dto.getUserId())
                .nickname(dto.getNickname())
                .hashedPassword(dto.getPassword())
                .phone(dto.getPhone())
                .userEmail(dto.getUserEmail())
                .build();
    }
}

