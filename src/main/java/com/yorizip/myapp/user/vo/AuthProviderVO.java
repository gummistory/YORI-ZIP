package com.yorizip.myapp.user.vo;

public class AuthProviderVO {
    private int providerId;
    private String providerName;
    private String providerType;

    // 기본 생성자
    public AuthProviderVO() {}

    // 필드 생성자
    public AuthProviderVO(int providerId, String providerName, String providerType) {
        this.providerId = providerId;
        this.providerName = providerName;
        this.providerType = providerType;
    }

    // Getter와 Setter 메서드
    public int getProviderId() {
        return providerId;
    }

    public void setProviderId(int providerId) {
        this.providerId = providerId;
    }

    public String getProviderName() {
        return providerName;
    }

    public void setProviderName(String providerName) {
        this.providerName = providerName;
    }

    public String getProviderType() {
        return providerType;
    }

    public void setProviderType(String providerType) {
        this.providerType = providerType;
    }

    @Override
    public String toString() {
        return "ProviderVO{" +
                "providerId=" + providerId +
                ", providerName='" + providerName + '\'' +
                ", providerType='" + providerType + '\'' +
                '}';
    }
}


