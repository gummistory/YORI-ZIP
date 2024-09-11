package com.yorizip.myapp.user.vo;

public class SocialLoginVO {
    private int socialId;
    private String socialCompany;
    private String socialLoginId;
    private String token;
    private Long userId; // 사용자 ID

    // 기본 생성자
    public SocialLoginVO() {}

    // 필드 생성자
    public SocialLoginVO(int socialId, String socialCompany, String socialLoginId, String token, Long userId) {
        this.socialId = socialId;
        this.socialCompany = socialCompany;
        this.socialLoginId = socialLoginId;
        this.token = token;
        this.userId = userId;
    }

    // Getter와 Setter 메서드
    public int getSocialId() {
        return socialId;
    }

    public void setSocialId(int socialId) {
        this.socialId = socialId;
    }

    public String getSocialCompany() {
        return socialCompany;
    }

    public void setSocialCompany(String socialCompany) {
        this.socialCompany = socialCompany;
    }

    public String getSocialLoginId() {
        return socialLoginId;
    }

    public void setSocialLoginId(String socialLoginId) {
        this.socialLoginId = socialLoginId;
    }

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    @Override
    public String toString() {
        return "SocialLoginVO{" +
                "socialId=" + socialId +
                ", socialCompany='" + socialCompany + '\'' +
                ", socialLoginId='" + socialLoginId + '\'' +
                ", token='" + token + '\'' +
                ", userId=" + userId +
                '}';
    }
}


