class ApplicationController < ActionController::Base
  protect_from_forgery

  # # fake the time for testing purposes
  # before_filter :adjust_time
  # def adjust_time
  #   Timecop.freeze Time.new(2013,1,22,0,0,1)
  # end

  def current_user_can_cancel?
    if current_user.eligible_today?
      true
    else
      false
    end
  end
  helper_method :user_can_cancel?

  def sessions_destroy(notice=nil)
    session[:user_id] = nil

    notice ||= "Signed out.  Thanks for using Jiehan&rsquo;s signup system!".html_safe
    redirect_to root_path, :notice => notice
  end

  def signup_restriction_human
    current_phase_details[:who_can_signup]
  end
  helper_method :signup_restriction_human

  def current_phase_name
    Phase.name
  end
  helper_method :current_phase_name

  def current_phase_details
    Phase.details
  end
  helper_method :current_phase_details

  def current_user_eligible?
    current_user.eligible_today?
  end
  helper_method :current_user_eligible?

  def current_user
    begin
      return @current_user ||= User.find(session[:user_id]) if session[:user_id]
    rescue => e
      sessions_destroy e.message
    end

    false
  end
  helper_method :current_user

  def signed_in?
    current_user
  end
  helper_method :signed_in?

  def current_user_signed_up_count
    if signed_in?
      current_user.signup_count
    else
      raise "Signed up count is not available for guests."
    end
  end
  helper_method :current_user_signed_up_count

  def current_user_signup_quota_remaining
    if signed_in?
      Settings.policy.students.max_shifts - current_user_signed_up_count
    else
      raise "Signed up quota is not available for guests."
    end
  end
  helper_method :current_user_signup_quota_remaining

  def peddie_login_path(origin)
    if origin.blank?
      "/auth/peddie"
    else
      "/auth/peddie?" + { :origin => origin }.to_query
    end
  end
  helper_method :peddie_login_path

  def permission_denied
    flash[:error] = "Sorry, you are not allowed to access that page."
    redirect_to root_url
  end


  private

  def current_phase
    Phase.current
  end
end
