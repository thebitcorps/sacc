class Admin::UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
      if @user.create(user_params)
        redirect_to @user, notice: 'User was successfully created.'
      else
        render :new
      end
  end

  def edit
    @user = User.find(params[:user])
  end

  def update
    @user = current_user
      if @user.update(user_params)
        redirect_to @user, notice: 'User was successfully updated.'
      else
        render :edit
      end
  end

  def update_password
    @user = User.find(current_user.id)
    if @user.update_attributes(params[:user])
      # Sign in the user by passing validation in case his password changed
      sign_in @user, :bypass => true
      redirect_to root_path
    else
      render "edit"
    end
  end

  def destroy
    
  end

  private
    def user_params
      params.require(:user).permit(:name, :paternal_lastname, :maternal_lastname, :email, :cellphone, :gender, :password)
    end
end
