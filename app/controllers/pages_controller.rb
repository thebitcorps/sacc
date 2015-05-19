class PagesController < ApplicationController
  before_filter :authenticate_user!

  def dashboard
    @my_clients = Client.my_clients(current_user)
  end

  def help
  end

  def about
  end
end
