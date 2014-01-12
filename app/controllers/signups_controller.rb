class SignupsController < ApplicationController
  before_action :set_signup, only: [:destroy]
  before_action :set_shift, only: [:new]
  before_action :set_committee, only: [:new]
  before_action :require_login, only: [:new, :create, :destroy]
  before_action :require_same_user, only: [:destroy]

  # GET /signups/new
  def new
    @signup = Signup.new
    @signup.shift = @shift
  end

  # POST /signups
  def create
    @signup = Signup.new(signup_params)
    @signup.user = current_user

    respond_to do |format|
      begin
        if @signup.save_and_update_counts!
          flash[:success] = 'You have signed up successfully!'
          format.html { redirect_to @signup.shift.committee }
        else
          format.html { render action: 'new' }
        end
      rescue => detail
        print detail.backtrace.join("\n") if !Rails.env.production?
        raise detail.to_yaml if !Rails.env.production?
        flash[:error] = "Error while signing you up: " + detail.message + '&nbsp;'*2 + 'Please try again.'
        redirect_to @signup.shift.committee
        return
      end
    end
  end

  # DELETE /signups/1
  def destroy
    begin
      @signup.destroy_and_update_counts!
    rescue => detail
      print detail.backtrace.join("\n") if !Rails.env.production?
      raise detail.to_yaml if !Rails.env.production?
      flash[:error] = "Error during canceling: " + detail.message
      redirect_to @signup.shift.committee
      return
    end

    respond_to do |format|
      format.html { redirect_to @signup.shift.committee, notice: 'We&rsquo;ve removed you from the list.'.html_safe }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_signup
      @signup = Signup.find(params[:id])
    end

    def set_shift
      @shift = Shift.find(params[:shift_id])
    end

    def set_committee
      @committee = @shift.committee
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def signup_params
      params.require(:signup).permit(:shift_id)
    end

    def require_same_user
      if @signup.user != current_user
        flash[:error] = "You cannot cancel shifts for others!"
        redirect_to @signup.shift.committee
      end
    end

end
