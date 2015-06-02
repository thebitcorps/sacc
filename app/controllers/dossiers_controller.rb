class DossiersController < ApplicationController
  before_filter :authenticate_user!
  skip_before_filter  :verify_authenticity_token
  before_action :set_dossier, only: [:show, :update]

  def documentize
    @client = Client.find(params[:client_id])
    @client.documentize
    redirect_to @client.dossier, notice: 'Dossier was successfully created.'
  end

  def show
    @locationInfo = JSON.parse @dossier.location_information.to_json, except: [:created_at, :updated_at]
    @spouse = JSON.parse @dossier.spouse_work_record.to_json, except: [:created_at, :updated_at] if @dossier.spouse_work_record
    @nominal = JSON.parse @dossier.nominal_work_record.to_json, except: [:created_at, :updated_at]
    @documents = JSON.parse @dossier.to_json include: [:documents], except: [:created_at, :updated_at]
  end

  def update
    if @dossier.update dossier_params
      render :json => @dossier.to_json(include: :documents, except: [:created_at, :updated_at])
    else
      render json: @dossier.errors , status: :unprocessable_entity
    end
  end

  private
    def set_dossier
      @dossier  = Dossier.find params[:id]
    end

    def dossier_params
      params.require(:dossier).permit(documents_attributes: [:id, :check])
    end
end
