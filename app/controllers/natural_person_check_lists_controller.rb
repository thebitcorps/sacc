class NaturalPersonCheckListsController < ApplicationController
  before_action :set_natural_person_check_list, only: [:show, :edit, :update, :destroy]

  # GET /natural_person_check_lists
  # GET /natural_person_check_lists.json
  def index
    @natural_person_check_lists = NaturalPersonCheckList.all
  end

  # GET /natural_person_check_lists/1
  # GET /natural_person_check_lists/1.json
  def show
  end

  # GET /natural_person_check_lists/new
  def new
    @natural_person_check_list = NaturalPersonCheckList.new
  end

  # GET /natural_person_check_lists/1/edit
  def edit
  end

  # POST /natural_person_check_lists
  # POST /natural_person_check_lists.json
  def create
    @natural_person_check_list = NaturalPersonCheckList.new(natural_person_check_list_params)

    respond_to do |format|
      if @natural_person_check_list.save
        format.html { redirect_to @natural_person_check_list, notice: 'Natural person check list was successfully created.' }
        format.json { render :show, status: :created, location: @natural_person_check_list }
      else
        format.html { render :new }
        format.json { render json: @natural_person_check_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /natural_person_check_lists/1
  # PATCH/PUT /natural_person_check_lists/1.json
  def update
    respond_to do |format|
      if @natural_person_check_list.update(natural_person_check_list_params)
        format.html { redirect_to @natural_person_check_list, notice: 'Natural person check list was successfully updated.' }
        format.json { render :show, status: :ok, location: @natural_person_check_list }
      else
        format.html { render :edit }
        format.json { render json: @natural_person_check_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /natural_person_check_lists/1
  # DELETE /natural_person_check_lists/1.json
  def destroy
    @natural_person_check_list.destroy
    respond_to do |format|
      format.html { redirect_to natural_person_check_lists_url, notice: 'Natural person check list was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_natural_person_check_list
      @natural_person_check_list = NaturalPersonCheckList.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def natural_person_check_list_params
      params.require(:natural_person_check_list).permit(:fiscal_statements, :finance_registration, :rfc, :annual_return)
    end
end
