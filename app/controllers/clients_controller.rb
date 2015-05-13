class ClientsController < ApplicationController
  before_action :set_client, only: [:show, :edit, :update, :destroy]

  def index
    @clients = Client.page(params[:page]).per(10)
  end

  def show
  end

  def new
    @client = Client.new
  end

  def edit
  end

  def create
    @client = Client.new(client_params)
    if @client.save
      redirect_to @client, notice: 'Client was successfully created.'
    else
      render :new
    end
  end

  def update
    if @client.update(client_params)
      redirect_to @client, notice: 'Client was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @client.destroy
    redirect_to clients_url, notice: 'Client was successfully destroyed.'
  end

  private
    def set_client
      @client = Client.find(params[:id])
    end

    def client_params
      params.require(:client).permit(:page,:name, :paternal_lastname, :maternal_lastname, :curp, :imss, :spouse, :birthdate, :mail, :income, :notes, :workplace, :gender,
                                      phones_attributes: [:number, :phone_type, :available_from, :available_to],
                                      addresses_attributes: [:street, :colony,:external_number, :internal_number,:zip_code])
    end
end
