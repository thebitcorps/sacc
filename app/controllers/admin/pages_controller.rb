class Admin::PagesController < ApplicationController
  before_action :authenticate_user!

  def dashboard
    @salesmen = User.salesmen
    @clients = Client.all
  end

end