package com.yorizip.myapp.favorite.mapper;

import com.yorizip.myapp.favorite.vo.FavoriteRecipeVO;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface FavoriteMapper {
    @Insert("INSERT INTO user_favorite_recipes (user_id, recipe_id) VALUES (#{userId}, #{recipeId})")
    void insertFavoriteRecipe(FavoriteRecipeVO favoriteRecipe);

    @Select("SELECT user_id AS userId, recipe_id AS recipeId FROM user_favorite_recipes WHERE user_id = #{userId}")
    List<FavoriteRecipeVO> getFavoriteRecipesByUserId(Long userId);

    @Delete("DELETE FROM user_favorite_recipes WHERE user_id = #{userId} AND recipe_id = #{recipeId}")
    void deleteFavoriteRecipe(@Param("userId") Long userId, @Param("recipeId") Long recipeId);
}
