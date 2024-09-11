package com.yorizip.myapp.user.dto;

public class KakaoUserInfo {
    private String providerId;
    private KakaoAccount kakao_account;

    // Inner class for KakaoAccount
    public static class KakaoAccount {
        private Boolean profile_nickname_needs_agreement;
        private Boolean profile_image_needs_agreement;
        private Profile profile;
        private Boolean has_email;
        private Boolean email_needs_agreement;
        private Boolean is_email_valid;
        private Boolean is_email_verified;
        private String email;

        // Getters and Setters for KakaoAccount
        public Boolean getProfile_nickname_needs_agreement() {
            return profile_nickname_needs_agreement;
        }

        public void setProfile_nickname_needs_agreement(Boolean profile_nickname_needs_agreement) {
            this.profile_nickname_needs_agreement = profile_nickname_needs_agreement;
        }

        public Boolean getProfile_image_needs_agreement() {
            return profile_image_needs_agreement;
        }

        public void setProfile_image_needs_agreement(Boolean profile_image_needs_agreement) {
            this.profile_image_needs_agreement = profile_image_needs_agreement;
        }

        public Profile getProfile() {
            return profile;
        }

        public void setProfile(Profile profile) {
            this.profile = profile;
        }

        public Boolean getHas_email() {
            return has_email;
        }

        public void setHas_email(Boolean has_email) {
            this.has_email = has_email;
        }

        public Boolean getEmail_needs_agreement() {
            return email_needs_agreement;
        }

        public void setEmail_needs_agreement(Boolean email_needs_agreement) {
            this.email_needs_agreement = email_needs_agreement;
        }

        public Boolean getIs_email_valid() {
            return is_email_valid;
        }

        public void setIs_email_valid(Boolean is_email_valid) {
            this.is_email_valid = is_email_valid;
        }

        public Boolean getIs_email_verified() {
            return is_email_verified;
        }

        public void setIs_email_verified(Boolean is_email_verified) {
            this.is_email_verified = is_email_verified;
        }

        public String getEmail() {
            return email;
        }

        public void setEmail(String email) {
            this.email = email;
        }
    }

    // Inner class for Profile
    public static class Profile {
        private String nickname;
        private String profile_image_url;

        public String getProfile_image_url() {
            return profile_image_url;
        }

        public void setProfile_image_url(String profile_image_url) {
            this.profile_image_url = profile_image_url;
        }

        // Getters and Setters for Profile
        public String getNickname() {
            return nickname;
        }

        public void setNickname(String nickname) {
            this.nickname = nickname;
        }
    }

    // Getters and Setters for KakaoProfile
    public String getProviderId() {
        return providerId;
    }

    public void setProviderId(String providerId) {
        this.providerId = providerId;
    }


    public KakaoAccount getKakao_account() {
        return kakao_account;
    }

    public void setKakao_account(KakaoAccount kakao_account) {
        this.kakao_account = kakao_account;
    }
}