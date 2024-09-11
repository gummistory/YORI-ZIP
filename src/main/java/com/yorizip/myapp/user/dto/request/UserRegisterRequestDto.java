package com.yorizip.myapp.user.dto.request;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserRegisterRequestDto {
    private String userName;
    private String userId;
    private String password;
    private String passwordConfirm;
    private String nickname;
    private String userEmail;
    private String phone;
    private boolean privacyAgree;
    private boolean marketingAgree;
}
