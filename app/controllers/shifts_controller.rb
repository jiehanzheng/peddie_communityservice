class ShiftsController < ApplicationController
  # GET /shifts
  # GET /shifts.json
  def index
    @shifts = Shift.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @shifts }
    end
  end

  # GET /shifts/1
  # GET /shifts/1.json
  def show
    @shift = Shift.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @shift }
    end
  end

  # GET /shifts/new
  # GET /shifts/new.json
  def new
    @shift = Shift.new

    if not fetch_committee_info
      return
    end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @shift }
    end
  end

  # GET /shifts/1/edit
  def edit
    @shift = Shift.find(params[:id])

    @committee = @shift.committee
  end

  # POST /shifts
  # POST /shifts.json
  def create
    params[:shift].parse_time_select! :start_time
    params[:shift].parse_time_select! :end_time
    params[:shift][:start_time] = params[:shift][:start_time].to_s :time
    params[:shift][:end_time] = params[:shift][:end_time].to_s :time
    @shift = Shift.new(params[:shift])

    respond_to do |format|
      if @shift.save
        format.html { redirect_to @shift, notice: 'Shift was successfully created.' }
        format.json { render json: @shift, status: :created, location: @shift }
      else
        if not fetch_committee_info params[:shift][:committee_id]
          return
        end
        format.html { render action: "new" }
        format.json { render json: @shift.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /shifts/1
  # PUT /shifts/1.json
  def update
    params[:shift].parse_time_select! :start_time
    params[:shift].parse_time_select! :end_time
    params[:shift][:start_time] = params[:shift][:start_time].to_s :time
    params[:shift][:end_time] = params[:shift][:end_time].to_s :time
    @shift = Shift.find(params[:id])

    respond_to do |format|
      if @shift.update_attributes(params[:shift])
        format.html { redirect_to @shift, notice: 'Shift was successfully updated.' }
        format.json { head :no_content }
      else
        if not fetch_committee_info params[:shift][:committee_id]
          return
        end
        format.html { render action: "edit" }
        format.json { render json: @shift.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shifts/1
  # DELETE /shifts/1.json
  def destroy
    @shift = Shift.find(params[:id])
    @shift.destroy

    respond_to do |format|
      format.html { redirect_to shifts_url }
      format.json { head :no_content }
    end
  end


  private

  def fetch_committee_info(committee_id=nil)
    committee_id ||= params[:committee_id]

    # if no committee is selected, redirect user back to committees#index
    if committee_id.blank?
      redirect_to committees_path, :alert => "You have to select a committee from a committee first."
      return false
    end

    # get committee information
    @committee = Committee.find(committee_id)
  end

  def discard_date_portion(datetime)
    datetime.to_time()
  end
end
