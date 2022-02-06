class RecipesController < ApplicationController
  before_action :require_user_logged_in, only: [:new, :create, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  
  def show
    @recipe = Recipe.find(params[:id])
    @steps = @recipe.steps.all
    @ingredients = @recipe.ingredients.all
  end

  def new
    @recipe = Recipe.new
    @foods = Food.all
    10.times{ @recipe.ingredients.build }
    @step = 3.times{@recipe.steps.build}
  end
  
  def create
    @recipe = current_user.recipes.build(recipe_params)
    
    if @recipe.save
      flash[:success] = 'レシピを登録しました。'
      redirect_to @recipe
    else
      flash.now[:danger] = 'レシピの登録に失敗しました。'
      (1..6).each do
        if @recipe.steps.size < 6
          @recipe.steps.build
        end
      end
      (1..10).each do
        if @recipe.ingredients.size < 10
          @recipe.ingredients.build
        end
      end
      render :new
    end
  end
  
  def edit
    (1..6).each do
      if @recipe.steps.size < 6
        @recipe.steps.build
      end
    end
    (1..10).each do
      if @recipe.ingredients.size < 10
        @recipe.ingredients.build
      end
    end
  end

  def update
    if @recipe.update(update_recipe_params)
      flash[:success] = 'レシピが正常に更新されました'
      redirect_to @recipe
    else
      flash.now[:danger] = 'レシピが更新されませんでした'
      (1..6).each do
        if @recipe.steps.size < 6
          @recipe.steps.build
        end
      end
      (1..10).each do
        if @recipe.ingredients.size < 10
          @recipe.ingredients.build
        end
      end
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
    params.require(:recipe).permit(:title, :explanation, :image, steps_attributes: [:num, :explanation], ingredients_attributes: [:food_id, :quantity])
  end
  
  def update_recipe_params
    params.require(:recipe).permit(:title, :explanation, :image, steps_attributes: [:num, :explanation, :_destroy, :id], ingredients_attributes: [:food_id, :quantity, :_destroy, :id])
  end
  
  def correct_user
    @recipe = current_user.recipes.find_by(id: params[:id])
    unless @recipe
      redirect_to root_url
    end
  end
end
