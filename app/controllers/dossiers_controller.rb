class DossiersController < ApplicationController

  def documentize
    @client = Client.find(params[:client_id])
    @client.documentize
    redirect_to @client.dossier, notice: 'Dossier was successfully created.'
  end

  def show
    @dossier = Dossier.find(params[:id])
    @client = @dossier.client
  end

end
