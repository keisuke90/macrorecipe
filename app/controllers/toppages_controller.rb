class ToppagesController < ApplicationController
  def index
    @pagy, @recipes = pagy(Recipe.all.order(id: :desc))
  end
  
  def search
    if params[:title].present?
      @pagy, @recipes = pagy(Recipe.where('title LIKE ?', "%#{params[:title]}%"))
    else
      @recipes = Recipe.none
    end
  end
end
