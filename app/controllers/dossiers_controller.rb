class DossiersController < ApplicationController
  before_filter :authenticate_user!
  skip_before_filter  :verify_authenticity_token

  def documentize
    @client = Client.find(params[:client_id])
    @client.documentize
    redirect_to @client.dossier, notice: 'Dossier was successfully created.'
  end

  def show
    @dossier = JSON.parse Dossier.find(params[:id]).to_json include: [:location_information,:nominal_work_record]
  end


private



end
