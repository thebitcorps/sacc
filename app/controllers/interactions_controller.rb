class InteractionsController < ApplicationController
  before_action :set_interaction, only: [:show, :edit, :update, :destroy]
  before_action :set_client, only: [:new,:edit]

  def index
    @interactions = Interaction.all
  end

  def show
  end


  def new
    @interaction = Interaction.new
  end

  def edit
  end

  def create
    @interaction = Interaction.new(interaction_params)

    respond_to do |format|
      if @interaction.save
        format.html { redirect_to @interaction, notice: 'Interaction was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @interaction.update(interaction_params)
        format.html { redirect_to @interaction, notice: 'Interaction was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @interaction.destroy
    respond_to do |format|
      format.html { redirect_to interactions_url, notice: 'Interaction was successfully destroyed.' }
    end
  end

  private
    def set_interaction
      @interaction = Interaction.find(params[:id])
    end

    def interaction_params
      params.require(:interaction).permit(:kind, :date, :time, :mood, :interest, :user_id, :client_id, :notes)
    end

    def set_client
      @client = Client.find params[:client_id]
    end
end
