class CommitteesController < ApplicationController
  before_action :set_committee, only: [:show]
  before_action :require_login, only: [:show] 

  # GET /committees
  def index
    @committees = Committee.includes(:shifts).load
  end

  # GET /committees/1
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_committee
      @committee = Committee.includes(shifts: [:signups]).find(params[:id])
    end
end
