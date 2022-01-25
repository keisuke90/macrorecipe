class ApplicationController < ActionController::Base
  include SessionsHelper
  include Pagy::Backend
  
  # rescue_from ActiveRecord::RecordNotFound, with: :render_404
  # rescue_from ActionController::RoutingError, with: :render_404
  # rescue_from Exception, with: :render_500
  
  # def render_404
  #   render template: 'errors/error_404', status: 404, layout: 'application', content_type: 'text/html'
  # end
  
  # def render_500
  #   render template: 'errors/error_500', status: 500, layout: 'application', content_type: 'text/html'
  # end
  
  private
  
  def require_user_logged_in
    unless logged_in?
      redirect_to login_url
    end
  end
  
  def require_user_admin
    unless current_user.admin
      redirect_to root_path
    end
  end
end
