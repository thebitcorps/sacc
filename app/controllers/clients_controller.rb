class ClientsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_client, only: [:show, :edit, :update, :update_phones, :update_credit, :destroy]
  skip_before_filter  :verify_authenticity_token
  helper_method :sort_column, :sort_direction

  def index
    my_clients = Client.my_clients(current_user)
    @clients = my_clients.search_by_fullname(params[:search]).order("#{sort_column} #{sort_direction}").page(params[:page]).per(10)
    respond_to do |format|
      format.html
      format.js{ @clients }
    end
  end

  def show
    @phones = @client.phones
    @dossier = JSON.parse @client.dossier.to_json include: [:documents], except: [:created_at, :updated_at]
  end

  def new
    @client = Client.new
  end

  def edit
  end

  def create
    @client = Client.new(client_params)
    @client.salesman = current_user
    if @client.save
      redirect_to @client, notice: 'Client was successfully created.'
    else
      render :new
    end
  end

  def update
    if @client.update(client_params)
      @client.update_documents
      render json: @client.to_json(include: :phones)
    else
      render json: @client.errors , status: :unprocessable_entity
    end
  end

  def update_phones
    if @client.update(client_params)
      @client.update_documents
      render json: @client.phones.to_json
    else
      render json: @client.errors , status: :unprocessable_entity
    end
  end

  def update_credit
    if @client.update(client_params)
      @client.update_documents
      render json: @client.dossier.documents.to_json
    else
      render json: @client.errors , status: :unprocessable_entity
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
      params.require(:client).permit(:search, :sort, :direction, :page, :name,
                                     :paternal_lastname, :maternal_lastname,
                                     :spouse, :birthdate, :mail, :notes,
                                     :spouse_birtdate,
                                     :gender, :marital_status, :spouse_works,
                                     :credit_type, :fiscal_entity,
                                     :offsprings, :dependents,
                                     :address, :division, :town, :zipcode,
                                     :current_place, :total_income,
                                     :pathway, :sales_channel, :status, :qualifies,
                                     phones_attributes: [:id, :number, :kind, :available_from, :available_to, :_destroy, :is_main])
    end

    def sort_column
      Client.searcheable_fields.include?(params[:sort]) ? params[:sort] : 'name'
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : 'asc'
    end
end
