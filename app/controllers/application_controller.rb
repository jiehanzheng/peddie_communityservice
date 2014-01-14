class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include SessionsHelper
  include BootstrapFlashHelper

  helper_method :current_user
  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  protected

    def require_login
      if !current_user
        flash[:warning] = "Please " + view_context.link_to("sign in", signin_path(request.original_url), :class => "alert-link") + " to view that page."
        redirect_to root_path
      end
    end
end
