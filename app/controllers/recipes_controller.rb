class RecipesController < ApplicationController
  before_action :require_user_logged_in, only: [:new, :create, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  
  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = current_user.recipes.build(recipe_params)
    if @recipe.save
      flash[:success] = 'レシピを投稿しました。'
      redirect_to root_url
    else
      flash.now[:danger] = 'レシピの投稿に失敗しました。'
      render 'recipes/new'
    end
  end
  
  def edit
  end

  def update
    if @recipe.update(recipe_params)
      flash[:success] = 'レシピが正常に更新されました'
      redirect_to @recipe
    else
      flash.now[:danger] = 'レシピが更新されませんでした'
      render :edit
    end
  end

  def destroy
    @recipe.destroy
    flash[:success] = 'レシピを削除しました。'
    redirect_to root_url
  end
  
  private
  
  def recipe_params
    params.require(:recipe).permit(:title, :explanation, :image)
  end
  
  def correct_user
    @recipe = current_user.recipes.find_by(id: params[:id])
    unless @recipe
      redirect_to root_url
    end
  end
end
