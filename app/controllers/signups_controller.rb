class SignupsController < ApplicationController
  # GET /signups
  # GET /signups.json
  def index
    @signups = Signup.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @signups }
    end
  end

  # GET /signups/1
  # GET /signups/1.json
  def show
    @signup = Signup.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @signup }
    end
  end

  # GET /signups/new
  # GET /signups/new.json
  def new
    @signup = Signup.new

    if not fetch_shift_info
      return
    end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @signup }
    end
  end

  # GET /signups/1/edit
  def edit
    @signup = Signup.find(params[:id])

    @shift = @signup.shift
  end

  # POST /signups
  # POST /signups.json
  def create
    @signup = Signup.new(params[:signup])

    @signup.user = current_user

    respond_to do |format|
      if @signup.save
        format.html { redirect_to @signup.shift.committee, notice: 'You are signed up!' }
        format.json { render json: @signup, status: :created, location: @signup }
      else
        if not fetch_shift_info params[:signup][:shift_id]
          return
        end
        format.html { render action: "new" }
        format.json { render json: @signup.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /signups/1
  # PUT /signups/1.json
  def update
    @signup = Signup.find(params[:id])

    respond_to do |format|
      if @signup.update_attributes(params[:signup])
        format.html { redirect_to @signup, notice: 'Signup was successfully updated.' }
        format.json { head :no_content }
      else
        if not fetch_shift_info params[:signup][:shift_id]
          return
        end
        format.html { render action: "edit" }
        format.json { render json: @signup.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /signups/1
  # DELETE /signups/1.json
  def destroy
    @signup = Signup.find(params[:id])
    @signup.destroy

    respond_to do |format|
      # format.html { redirect_to signups_url }
      format.html { redirect_to @signup.shift.committee, notice: 'We&rsquo;ve removed you from the list.'.html_safe }
      format.json { head :no_content }
    end
  end


  private

  def fetch_shift_info(shift_id=nil)
    shift_id ||= params[:shift_id]

    # if no shift is selected, redirect user back to shifts#index
    if shift_id.blank?
      redirect_to committees_path, :alert => "You have to select a shift from a committee first."
      return false
    end

    # get shift information
    @shift = Shift.find(shift_id)
  end
end
