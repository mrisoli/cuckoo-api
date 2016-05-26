class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:show, :update, :destroy]

  def index
    @appointments = Appointment.all

    render json: @appointments
  end

  def show
    render json: @appointment
  end

  def create
    @appointment = Appointment.new(appointment_params)

    if @appointment.save
      render json: @appointment, status: :created, location: @appointment
    else
      render json: @appointment.errors, status: :unprocessable_entity
    end
  end

  def update
    if @appointment.update(appointment_params.merge(manually_updated: true))
      render json: @appointment
    else
      render json: @appointment.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @appointment.destroy
  end

  private

    def set_appointment
      @appointment = Appointment.find(params[:id])
    end

    def appointment_params
      params.require(:appointment).permit(:title, :start, :status)
    end
end
