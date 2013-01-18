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


  # cheat signin mechanism to enable Capybara to sign in without having to access
  # Google services
  #
  def secret_signin_page
    if Rails.env.production?
      raise "Do not try to do this in production environment"
    end
  end

  def secret_signin
    if Rails.env.production?
      raise "Do not try to do this in production environment"
    end

    user = User.find_by_uid(request[:uid])
    session[:user_id] = user.id
    redirect_to root_path, :notice => "Welcome!  You've successfully signed in via your cheating account."
  end
end