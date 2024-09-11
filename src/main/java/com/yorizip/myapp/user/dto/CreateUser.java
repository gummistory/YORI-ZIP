package com.yorizip.myapp.user.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class CreateUser {
    private String userName;
    private String nickname;
    private String hashedPassword;
    private String phone;
    private String userEmail;
    private int authProviderID;
    private String profileImgUrl;
}
