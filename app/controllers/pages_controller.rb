class PagesController < ApplicationController
  before_filter :authenticate_user!

  def dashboard
    @my_clients = Client.my_clients(current_user).page(params[:page]).per(10)
    @today_appointments = current_user.today_appointments
  end

  def help
  end

  def about
  end


end
