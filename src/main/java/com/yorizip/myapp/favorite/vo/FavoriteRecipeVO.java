package com.yorizip.myapp.favorite.vo;

public class FavoriteRecipeVO {
    private Long userId;
    private Long recipeId;

    public FavoriteRecipeVO() {}

    public FavoriteRecipeVO(Long userId, Long recipeId) {
        this.userId = userId;
        this.recipeId = recipeId;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public Long getRecipeId() {
        return recipeId;
    }

    public void setRecipeId(Long recipeId) {
        this.recipeId = recipeId;
    }

    @Override
    public String toString() {
        return "FavoriteRecipeVO{" +
                "userId=" + userId +
                ", recipeId=" + recipeId +
                '}';
    }
}

