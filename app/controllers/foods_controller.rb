class FoodsController < ApplicationController
  before_action :require_user_admin, only: [:csv_import]
  
  def csv_import
    Food.import(params[:file])
  end
end
