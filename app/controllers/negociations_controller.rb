class NegociationsController < ApplicationController
# "client_id", "house_id", "authorized_by", "final_price", "months", "due",
# "signature_date", "witness1", "witness2", "created_at", "updated_at"
  before_filter :authenticate_user!
  before_action :set_negociation, only: [:show, :edit, :update, :destroy]

  def index
    @negociations = Negociation.all
  end

  def new
    @client = Client.find(params[:client])
    @salesman = current_user
    @available_houses = House.untaken
    @negociation = Negociation.new(client: @client)
  end

  def create
    @negociation = Negociation.new(negociation_params)
    if @negociation.save
      redirect_to @negociation, notice: 'negociation was successfully created.'
    else
      render :new
    end
  end

  def show
  end

  def edit
    @salesman = current_user
    @available_houses = House.untaken
  end

  def update
    if @negociation.update(negociation_params)
      redirect_to @negociation, notice: 'negociation was successfully updated.'
    else
      render :edit
    end
  end

  def destroy #simulated destroy
    # @negociation.house.status = disponible # cambiar el status antes de nulificar la negociacion
    # @negocation.house = nil ; save # nulificar la negociación para tener la casa disponible y dejarla en un log
    # buscar destruir la pura asociación
    @negociation.house.set_status('available')
    @negociation.house = nil
    if @negociation.save
      # Log cancelled negociation for management ! # Logger model maybe?
      redirect_to @negociation, notice: 'Negociation was cancelled.'
    else
      render :edit
    end
  end

private

  def set_negociation
    @negociation = Negociation.find(params[:id])
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
