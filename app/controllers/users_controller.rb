class UsersController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update] #, :destroy]

  # def index
  #   @users = User.all.order 'name'
  # end

  def show
  end

  # def new
  #   @user = User.new
  # end

  def edit
  end

  # def create
  #   @user = User.new(user_params)
  #   # talk later about password
  #   @user.password = "CACACACACA"
  #   @user.password_confirmation = "CACACACACA"
  #   if @user.save
  #     redirect_to @user, notice: 'User was successfully created.'
  #   else
  #     render :new
  #   end
  # end

  def update
      if @user.update(user_params)
        redirect_to @user, notice: 'User was successfully updated.'
      else
        render :edit
      end
  end

  # def destroy
  #   @user.destroy
  #   redirect_to users_url, notice: 'User was successfully destroyed.'
  # end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :paternal_lastname, :maternal_lastname, :email, :cellphone, :gender)
    end
end
