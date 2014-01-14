class SessionsController < ApplicationController
  protect_from_forgery :except => :create

  def create
    begin
      user = User.from_auth_hash(auth_hash)
    rescue => detail
      raise detail.message if !Rails.env.production?
      flash[:error] = "Authentication error: " + detail.message + '&nbsp;'*2 + 'If this happens repeatedly, please try clearing your cookies.'
      redirect_to root_path
      return
    end

    session[:user_id] = user.id
    redirect_to (request.env['omniauth.origin'] || root_path), :notice => "You have signed in as " + user.first_name + "."
  end

  # POST /session/destroy
  def destroy
    session[:user_id] = nil
    redirect_to root_path, :notice => "Signed out successfully."
  end


  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
