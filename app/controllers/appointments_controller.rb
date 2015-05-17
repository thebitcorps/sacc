class AppointmentsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]

  def index
    # @appointments = current_user.appointments
    @appointments = Appointment.where(user: current_user).order('date')
  end

  def show
  end

  def new
    @appointment = Appointment.new
  end

  def edit
  end

  def create
    @appointment = Appointment.new(appointment_params)
    @appointment.user = current_user
    if @appointment.save
      redirect_to @appointment, notice: 'Appointment was successfully created.'
    else
      render :new
    end
  end

  def update
    if @appointment.update(appointment_params)
      @appointment.user = current_user
      redirect_to @appointment, notice: 'Appointment was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @appointment.destroy
    redirect_to appointments_url, notice: 'Appointment was successfully destroyed.'
  end

  private
    def set_appointment
      @appointment = Appointment.find(params[:id])
    end

    def appointment_params
      params.require(:appointment).permit(:date, :notes, :time, :mood, :interest,:client_id)
    end
end
