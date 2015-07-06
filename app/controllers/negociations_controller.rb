class NegociationsController < ApplicationController
# "client_id", "house_id", "authorized_by", "final_price", "months", "due",
# "signature_date", "witness1", "witness2", "created_at", "updated_at"

  def index
    @negociations = Negociation.all
  end

  def new
    @client = Client.find(params[:client])
    salesman = current_user
    @available_houses = House.available 
    @negociation = Negociation.new(client: @client)
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end

  def cancel
    # @negociation.house.status = disponible # cambiar el status antes de nulificar la negociacion
    # @negocation.house = nil ; save # nulificar la negociación para tener la casa disponible y dejarla en un log
  end

  def negociation_params
    params.require(:negociation).permit(:final_price, 
                                        :client, :house,
                                        :months, :due, 
                                        :signature_date, 
                                        :witness1, :witness2
                                        )
  end
end
