class ToppagesController < ApplicationController
  
  def index
    p_from = params[:p_min].blank? ? "0" : params[:p_min]
    p_to = params[:p_max].blank? ? "100000" : params[:p_max]
    f_from = params[:f_min].blank? ? "0" : params[:f_min]
    f_to = params[:f_max].blank? ? "100000" : params[:f_max]
    c_from = params[:c_min].blank? ? "0" : params[:c_min]
    c_to = params[:c_max].blank? ? "100000" : params[:c_max]
    
    if params[:title].present?
      @pagy, @recipes = pagy(Recipe.where('title LIKE ?', "%#{params[:title]}%").where(protein: p_from..p_to).where(fat: f_from..f_to).where(carbo: c_from..c_to).order(id: :desc), items: 9)
    else
      @pagy, @recipes = pagy(Recipe.includes(:user).where(protein: p_from..p_to).where(fat: f_from..f_to).where(carbo: c_from..c_to).order(id: :desc), items: 9)
    end
  end
  
end
