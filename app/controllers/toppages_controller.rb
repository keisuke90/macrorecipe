class ToppagesController < ApplicationController

  # food_ids = []
  # @recipes.each do |recipe|
  #   recipe.ingredients.each do |ingredient|
  #     food_ids << ingredient.food_id
  #   end
  # end
  # foods = Food.where(id: food_ids.uniq)
  
  def index
    if params[:title].present?
      @pagy, @recipes = pagy(Recipe.where('title LIKE ?', "%#{params[:title]}%"), items: 9)
    else
      @pagy, @recipes = pagy(Recipe.all.order(id: :desc), items: 9)
    end
  end
end
