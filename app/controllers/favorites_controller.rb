class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    recipe = Recipe.find(params[:recipe_id])
    current_user.favorite(recipe)
    flash[:success] = 'お気に入りに追加しました。'
    redirect_back(fallback_location: root_path)
  end

  def destroy
    recipe = Recipe.find(params[:recipe_id])
    current_user.unfavorite(recipe)
    flash[:success] = 'お気に入りを解除しました。'
    redirect_to recipe_path(params[:recipe_id])
  end
end
