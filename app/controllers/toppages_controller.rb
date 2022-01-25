class ToppagesController < ApplicationController
  
  def index
    p_from = params[:p_min].blank? ? "0" : params[:p_min]
    f_from = params[:f_min].blank? ? "0" : params[:f_min]
    c_from = params[:c_min].blank? ? "0" : params[:c_min]
    
    if params[:title].present?
      recipes = Recipe.where('title LIKE ?', "%#{params[:title]}%")
      recipes = recipes.where('protein >= ?', p_from)
      recipes = recipes.where('protein <= ?', params[:p_max]) unless params[:p_max].blank?
      recipes = recipes.where('fat >= ?', f_from)
      recipes = recipes.where('fat <= ?', params[:f_max]) unless params[:f_max].blank?
      recipes = recipes.where('carbo >= ?', c_from)
      recipes = recipes.where('carbo <= ?', params[:c_max]) unless params[:c_max].blank?
      @pagy, @recipes = pagy(recipes.order(id: :desc), items: 9)
    else
      recipes = Recipe.includes(:user)
      recipes = recipes.where('protein >= ?', p_from)
      recipes = recipes.where('protein <= ?', params[:p_max]) unless params[:p_max].blank?
      recipes = recipes.where('fat >= ?', f_from)
      recipes = recipes.where('fat <= ?', params[:f_max]) unless params[:f_max].blank?
      recipes = recipes.where('carbo >= ?', c_from)
      recipes = recipes.where('carbo <= ?', params[:c_max]) unless params[:c_max].blank?
      @pagy, @recipes = pagy(recipes.order(id: :desc), items: 9)
    end
  end
  
end
