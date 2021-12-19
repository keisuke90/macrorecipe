class ToppagesController < ApplicationController
  def index
    @pagy, @recipes = pagy(Recipe.all.order(id: :desc))
    @protein = 20
    @fat = 10
    @carbo = 40
    
  end
  
  def search
    if params[:title].present?
      @pagy, @recipes = pagy(Recipe.where('title LIKE ?', "%#{params[:title]}%"))
    else
      @recipes = Recipe.none
    end
  end
end
