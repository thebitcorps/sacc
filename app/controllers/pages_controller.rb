class PagesController < ApplicationController
  before_filter :authenticate_user!

  def dashboard
    @my_clients = Client.my_clients(current_user).all_profiled.page(params[:page]).per(10)
    @today_appointments = current_user.today_appointments
    @today_interactions = Interaction.created_today(current_user)
    @new_clients = Client.created_today(current_user)
  end

  def help
  end

  def about
  end


end
