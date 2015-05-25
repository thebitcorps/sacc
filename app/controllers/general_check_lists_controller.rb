class GeneralCheckListsController < ApplicationController
  before_action :set_general_check_list, only: [:show, :edit, :update, :destroy]

  # GET /general_check_lists
  # GET /general_check_lists.json
  def index
    @general_check_lists = GeneralCheckList.all
  end

  # GET /general_check_lists/1
  # GET /general_check_lists/1.json
  def show
  end

  # GET /general_check_lists/new
  def new
    @general_check_list = GeneralCheckList.new
  end

  # GET /general_check_lists/1/edit
  def edit
  end

  # POST /general_check_lists
  # POST /general_check_lists.json
  def create
    @general_check_list = GeneralCheckList.new(general_check_list_params)

    respond_to do |format|
      if @general_check_list.save
        format.html { redirect_to @general_check_list, notice: 'General check list was successfully created.' }
        format.json { render :show, status: :created, location: @general_check_list }
      else
        format.html { render :new }
        format.json { render json: @general_check_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /general_check_lists/1
  # PATCH/PUT /general_check_lists/1.json
  def update
    respond_to do |format|
      if @general_check_list.update(general_check_list_params)
        format.html { redirect_to @general_check_list, notice: 'General check list was successfully updated.' }
        format.json { render :show, status: :ok, location: @general_check_list }
      else
        format.html { render :edit }
        format.json { render json: @general_check_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /general_check_lists/1
  # DELETE /general_check_lists/1.json
  def destroy
    @general_check_list.destroy
    respond_to do |format|
      format.html { redirect_to general_check_lists_url, notice: 'General check list was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_general_check_list
      @general_check_list = GeneralCheckList.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def general_check_list_params
      params.require(:general_check_list).permit(:bank_request, :ife, :address_proof, :birth_certificate)
    end
end
