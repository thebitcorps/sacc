class PagesController < ApplicationController
  before_action :authenticate_user!
  before_action :adminDashboard?, only: :dashboard

  def dashboard
    @my_clients = Client.my_clients(current_user).all_profiled.page(params[:page]).per(10)
    @today_appointments = current_user.today_appointments
    @today_interactions = Interaction.created_today(current_user)
    @new_clients = Client.created_today(current_user)
    respond_to do |format|
      format.html
      format.js{ @my_clients }
    end
  end

  def help
  end

  def about
  end

  private
    def adminDashboard?
      redirect_to admin_root_path if current_user.admin?
    end


end
