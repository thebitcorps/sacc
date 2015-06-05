class Admin::PagesController < ApplicationController
  before_action :authenticate_user!

  def dashboard
    @salesmen = User.salesmen
    @clients = Client.all
    @profiled_clients = Client.where(profiled: true)
    @potential_clients = Client.where(potential: true)
  end

end