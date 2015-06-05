class Admin::UsersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :get_user, :only => [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def show
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to admin_users_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if params[:user][:password].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end
    if @user.update_attributes(user_params)
      redirect_to admin_users_path, notice: 'User updated.'
    else
      render "edit"
    end
  end

  def destroy
    @user.destroy
  end

  private

  def get_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :paternal_lastname, :maternal_lastname, :email, :cellphone, :gender, :password, :role_ids)
  end
end
