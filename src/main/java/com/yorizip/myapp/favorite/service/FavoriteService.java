package com.yorizip.myapp.favorite.service;

import com.yorizip.myapp.favorite.mapper.FavoriteMapper;
import com.yorizip.myapp.favorite.vo.FavoriteRecipeVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FavoriteService {

    private final FavoriteMapper favoriteMapper;

    public FavoriteService(FavoriteMapper favoriteMapper) {
        this.favoriteMapper = favoriteMapper;
    }

    public void addFavoriteRecipe(Long userId, Long recipeId) {
        FavoriteRecipeVO favoriteRecipe = new FavoriteRecipeVO(userId, recipeId);
        favoriteMapper.insertFavoriteRecipe(favoriteRecipe);
    }

    public List<FavoriteRecipeVO> getFavoriteRecipesByUserId(Long userId) {
        return favoriteMapper.getFavoriteRecipesByUserId(userId);
    }

    public void removeFavoriteRecipe(Long userId, Long recipeId) {
        favoriteMapper.deleteFavoriteRecipe(userId, recipeId);
    }
}
