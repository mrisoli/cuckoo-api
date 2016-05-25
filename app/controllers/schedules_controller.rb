class SchedulesController < ApplicationController
  before_action :set_schedule, only: [:show, :update, :destroy]

  def index
    @appointments = Schedule.all

    render json: @schedules
  end

  def show
    render json: @schedule
  end

  def create
    if @schedule = ScheduleCreator.call(schedule_params)
      render json: @schedule, status: :created, location: @schedule
    else
      render json: @schedule.errors, status: :unprocessable_entity
    end
  end

  def update
    if @schedule.update(schedule_params)
      render json: @schedule
    else
      render json: @schedule.errors, status: :unprocessable_entity
    end
  end

  def destroy
    ScheduleDestroyer.call(@schedule)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_schedule
      @schedule = Schedule.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def schedule_params
      params.require(:schedule).permit(:pattern, :time, :title, :start, :end)
    end
end
