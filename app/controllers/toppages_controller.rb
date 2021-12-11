class ToppagesController < ApplicationController
  def index
    @pagy, @recipes = pagy(Recipe.all.order(id: :desc))
  end
end
