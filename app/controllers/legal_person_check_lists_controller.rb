class LegalPersonCheckListsController < ApplicationController
  before_action :set_legal_person_check_list, only: [:show, :edit, :update, :destroy]

  # GET /legal_person_check_lists
  # GET /legal_person_check_lists.json
  def index
    @legal_person_check_lists = LegalPersonCheckList.all
  end

  # GET /legal_person_check_lists/1
  # GET /legal_person_check_lists/1.json
  def show
  end

  # GET /legal_person_check_lists/new
  def new
    @legal_person_check_list = LegalPersonCheckList.new
  end

  # GET /legal_person_check_lists/1/edit
  def edit
  end

  # POST /legal_person_check_lists
  # POST /legal_person_check_lists.json
  def create
    @legal_person_check_list = LegalPersonCheckList.new(legal_person_check_list_params)

    respond_to do |format|
      if @legal_person_check_list.save
        format.html { redirect_to @legal_person_check_list, notice: 'Legal person check list was successfully created.' }
        format.json { render :show, status: :created, location: @legal_person_check_list }
      else
        format.html { render :new }
        format.json { render json: @legal_person_check_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /legal_person_check_lists/1
  # PATCH/PUT /legal_person_check_lists/1.json
  def update
    respond_to do |format|
      if @legal_person_check_list.update(legal_person_check_list_params)
        format.html { redirect_to @legal_person_check_list, notice: 'Legal person check list was successfully updated.' }
        format.json { render :show, status: :ok, location: @legal_person_check_list }
      else
        format.html { render :edit }
        format.json { render json: @legal_person_check_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /legal_person_check_lists/1
  # DELETE /legal_person_check_lists/1.json
  def destroy
    @legal_person_check_list.destroy
    respond_to do |format|
      format.html { redirect_to legal_person_check_lists_url, notice: 'Legal person check list was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_legal_person_check_list
      @legal_person_check_list = LegalPersonCheckList.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def legal_person_check_list_params
      params.require(:legal_person_check_list).permit(:business_statements, :personal_statements, :charter, :personal_rfc, :business_rfc, :business_finance_registration_boolean, :personal_finance_registration, :annual_return, :financial_statements)
    end
end
