class NominalWorkRecordController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_nominal_work, only: [:update]
  skip_before_filter  :verify_authenticity_token

  def update
    if @nominalWork.update nominal_work_record_params
      render json: @nominalWork.to_json
    else
      render json: @nominalWork.errors , status: :unprocessable_entity
    end
  end

  private
  def set_nominal_work
    @nominalWork = NominalWorkRecord.find params[:id]
  end

  def nominal_work_record_params
    params.require(:nominal_work_record).permit(:name, :phone, :address, :extension, :zip_code, :position, :email, :seniority, :income)
  end
end
