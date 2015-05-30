class SpouseWorkRecordController < ApplicationController
  before_action :set_nominal_work, only: [:update]
  skip_before_filter  :verify_authenticity_token
  def update
    if @spouse.update spouse_work_record_params
      render json: @spouse.to_json
    else
      render json: @spouse.errors , status: :unprocessable_entity
    end

  end

  private
  def set_nominal_work
    @spouse = SpouseWorkRecord.find params[:id]
  end

  def spouse_work_record_params
    params.require(:spouse_work_record).permit(:name,:phone,:address,:extension,:zip_code,:position,:email,:seniority,:income,)
  end
end
