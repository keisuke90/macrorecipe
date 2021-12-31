class ToppagesController < ApplicationController
  
  def index
    if params[:title].present?
      @pagy, @recipes = pagy(Recipe.where('title LIKE ?', "%#{params[:title]}%").order(id: :desc), items: 9)
    else
      @pagy, @recipes = pagy(Recipe.all.order(id: :desc), items: 9)
    end
  end
  
end
