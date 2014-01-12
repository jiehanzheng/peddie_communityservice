module SessionsHelper

  def current_user=(user)
    if user == nil
      session[:user_id] = nil
    else
      @current_user = user
      session[:user_id] = @current_user.id
    end
  end

  def current_user
    @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
  end

  def signin_path(origin)
    if origin.blank?
      "/auth/peddie"
    else
      "/auth/peddie?" + { :origin => origin }.to_query
    end
  end

end
