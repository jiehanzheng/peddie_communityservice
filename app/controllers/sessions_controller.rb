class SessionsController < ApplicationController
  def create
    begin
      auth = request.env["omniauth.auth"]
      user = User.from_omniauth(auth)
      session[:user_id] = user.id
      redirect_to (request.env['omniauth.origin'] || root_path), :notice => "Welcome!  You've successfully signed in via your #{auth["provider"].titleize} account."
    rescue => e
      raise e if not Rails.env.production?
      redirect_to root_path, :alert => e.message
    end
  end

  def destroy(notice=nil)
    sessions_destroy(notice)
  end
end