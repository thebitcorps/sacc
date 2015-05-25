class WageCheckListsController < ApplicationController
  before_action :set_wage_check_list, only: [:show, :edit, :update, :destroy]

  # GET /wage_check_lists
  # GET /wage_check_lists.json
  def index
    @wage_check_lists = WageCheckList.all
  end

  # GET /wage_check_lists/1
  # GET /wage_check_lists/1.json
  def show
  end

  # GET /wage_check_lists/new
  def new
    @wage_check_list = WageCheckList.new
  end

  # GET /wage_check_lists/1/edit
  def edit
  end

  # POST /wage_check_lists
  # POST /wage_check_lists.json
  def create
    @wage_check_list = WageCheckList.new(wage_check_list_params)

    respond_to do |format|
      if @wage_check_list.save
        format.html { redirect_to @wage_check_list, notice: 'Wage check list was successfully created.' }
        format.json { render :show, status: :created, location: @wage_check_list }
      else
        format.html { render :new }
        format.json { render json: @wage_check_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /wage_check_lists/1
  # PATCH/PUT /wage_check_lists/1.json
  def update
    respond_to do |format|
      if @wage_check_list.update(wage_check_list_params)
        format.html { redirect_to @wage_check_list, notice: 'Wage check list was successfully updated.' }
        format.json { render :show, status: :ok, location: @wage_check_list }
      else
        format.html { render :edit }
        format.json { render json: @wage_check_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wage_check_lists/1
  # DELETE /wage_check_lists/1.json
  def destroy
    @wage_check_list.destroy
    respond_to do |format|
      format.html { redirect_to wage_check_lists_url, notice: 'Wage check list was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wage_check_list
      @wage_check_list = WageCheckList.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def wage_check_list_params
      params.require(:wage_check_list).permit(:payroll_statements, :payslips, :labor_letter)
    end
end
