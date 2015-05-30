class DossiersController < ApplicationController
  before_filter :authenticate_user!
  skip_before_filter  :verify_authenticity_token

  def documentize
    @client = Client.find(params[:client_id])
    @client.documentize
    redirect_to @client.dossier, notice: 'Dossier was successfully created.'
  end

  def show
    dossier  = Dossier.find params[:id]
    @dossier = JSON.parse dossier.to_json include: [:location_information,:nominal_work_record,:nominal_work_record]
    @spouse = JSON.parse dossier.spouse_work_record.to_json if dossier.spouse_work_record
    @nominal = JSON.parse dossier.nominal_work_record.to_json
  end

end

