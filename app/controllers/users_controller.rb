class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:show]

  
  def show
    @user = User.find(params[:id])
    
    if @user.id == session[:user_id]
      @pagy, @recipes = pagy(@user.recipes.order(id: :desc), items: 9)
    else
      redirect_to root_path
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:success] = 'ユーザを登録しました。'
      session[:user_id] = @user.id
      redirect_to root_path
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
  end
  
  def likes
    @user = User.find(params[:id])
    
    if @user.id == session[:user_id]
      @pagy, @recipes = pagy(@user.likes.order(id: :desc), items: 9)
    else
      redirect_to root_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
