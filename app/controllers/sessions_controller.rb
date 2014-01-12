class SessionsController < ApplicationController
  protect_from_forgery :except => :create

  def create
    @user = User.from_auth_hash(auth_hash)
    self.current_user = @user
    redirect_to (request.env['omniauth.origin'] || root_path), :notice => "You have signed in as " + @user.first_name + "."
  end

  # POST /session/destroy
  def destroy
    self.current_user = nil
    redirect_to root_path, :notice => "Signed out successfully."
  end


  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
