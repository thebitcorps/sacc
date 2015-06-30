class InteractionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_interaction, only: [:show, :edit, :update, :destroy]
  before_action :set_client, only: [:index, :edit, :new]

  def index
    @interactions = @client.interactions
  end

  def show
  end

  def new
    @interaction = Interaction.new(client_id: @client.id)
  end

  def edit
  end

  def create
    @interaction = Interaction.new(interaction_params)
    @interaction.user = current_user
    respond_to do |format|
      if @interaction.save
       format.html { redirect_to Client.find(params[:interaction][:client_id]), notice: 'Interaction was successfully created.'}
       format.json{ render json: @interaction}
      else
        @client = Client.find params[:interaction][:client_id]
        render :new
      end
    end
  end

  def update
    if @interaction.update(interaction_params)
      @interaction.user = current_user
      @client = Client.find params[:interaction][:client_id]
      redirect_to @client, notice: 'Interaction was successfully updated.'
    else
      @client = Client.find params[:interaction][:client_id]
      render :edit
    end
  end

  def destroy
    @interaction.destroy
    redirect_to :back, notice: 'Interaction was successfully destroyed.'
  end

  private
    def set_interaction
      @interaction = Interaction.find(params[:id])
    end

    def interaction_params
      params.require(:interaction).permit(:kind, :date, :time, :mood, :interest, :user_id, :client_id, :notes)
    end

    def set_client
      @client = Client.find(params[:client_id])
    end
end
