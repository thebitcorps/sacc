class HousesController < ApplicationController
  before_filter :authenticate_user!
  def index
    @houses  =  class_eval %Q{House.#{sanitize_type_list}().page(#{params[:page]}).per(25)}
    respond_to do |format|
      format.html
      format.js{ @houses }
    end
  end

  private
  def sanitize_type_list
    House.type_list.include?(params[:type_list]) ? params[:type_list] : 'available'
  end
end
