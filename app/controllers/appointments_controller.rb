class AppointmentsController < ApplicationController
  before_filter :authenticate_user!
  skip_before_filter  :verify_authenticity_token
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]
  before_action :set_client,only: [ :new, :edit , :client]

  def index
    # I think this scoping goes into the model :\
    @appointments = class_eval %Q{Appointment.#{sanitize_type_list}_from(#{current_user.id.to_s})}
    respond_to do |format|
      format.html
      format.js { @appointments }
    end
  end

  def client
    @appointments = @client.appointments
  end

  def show
  end

  def new
    @appointment = Appointment.new
    @complete = complete_param
  end

  def edit
    @complete = complete_param
  end

  def create
    @appointment = Appointment.new(appointment_params)
    @appointment.status = 'upcoming'
    @appointment.user = current_user
    if @appointment.save
      # MessageManager.reminder(0, @appointment)
      redirect_to @appointment, notice: 'Appointment was successfully created.'
    else
      render :new
    end
  end

  def update
    respond_to do |format|
      if @appointment.update(appointment_params)
        @appointment.user = current_user
          format.html{redirect_to @appointment, notice: 'Appointment was successfully updated.'}
          format.json{ render json: @appointment }
      else
        format.html {render :edit}
        format.json{render json: @appointment.errors,status: :unprocessable_entity  }
      end
    end
  end

  def destroy
    @appointment.destroy
    redirect_to appointments_url, notice: 'Appointment was successfully destroyed.'
  end

  private
    def complete_param
      params[:complete] == 'true' ? true : false
    end

    # validate that the params is one that matches the method in the model
    def sanitize_type_list
      Appointment.type_list.include?(params[:type_list]) ? params[:type_list] : 'today'
    end

    def set_appointment
      @appointment = Appointment.find(params[:id])
    end

    def appointment_params
      params.require(:appointment).permit(:date, :place, :time, :status, :client_id, :notes)
    end

    def set_client
      @client = Client.find params[:client_id]
    end
end
