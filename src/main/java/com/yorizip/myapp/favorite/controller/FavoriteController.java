package com.yorizip.myapp.favorite.controller;

import com.yorizip.myapp.favorite.service.FavoriteService;
import com.yorizip.myapp.favorite.vo.FavoriteRecipeVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@Controller
public class FavoriteController {

    private static final Logger log = LoggerFactory.getLogger(FavoriteController.class);
    private final FavoriteService favoriteService;


    public FavoriteController(FavoriteService favoriteService) {
        this.favoriteService = favoriteService;
    }

    // 사용자가 레시피를 찜하는 API
    @PostMapping("/{userId}/favorite")
    @ResponseBody
    public String addFavoriteRecipe(@PathVariable Long userId, @RequestBody Map<String, Long> requestBody) {
        Long recipeId = requestBody.get("recipeId"); // JSON에서 recipeId를 가져옴
        favoriteService.addFavoriteRecipe(userId, recipeId);
        log.info("########################### Recipe ID: " + recipeId);
        return "Recipe added to favorites successfully!";
    }


    @GetMapping("/{userId}/favorite")
    public String getFavoriteRecipes(@PathVariable Long userId, Model model) {
        // 사용자의 찜한 레시피 목록을 가져옴
        List<FavoriteRecipeVO> favoriteRecipes = favoriteService.getFavoriteRecipesByUserId(userId);

        // 모델에 데이터를 추가하여 JSP 페이지로 전달
        model.addAttribute("favoriteRecipes", favoriteRecipes);

        // JSP 페이지로 이동
        return "mypage/mypage_recipe";
    }


    // 사용자가 찜한 레시피를 삭제하는 API
    @DeleteMapping("/{userId}/favorite")
    @ResponseBody
    public String removeFavoriteRecipe(@PathVariable Long userId, @RequestParam Long recipeId) {
        favoriteService.removeFavoriteRecipe(userId, recipeId);
        return "Recipe removed from favorites successfully!";
    }
}
