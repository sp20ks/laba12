# frozen_string_literal: true

# class of controller
class UsersController < ApplicationController
  before_action :set_user, only: %i[ edit update destroy]

  def index; end

  def show
    @users = User.all
  end

  # GET /users/new
  def new
    @user = User.new
  end

  def edit; end

  def create
    @user = User.new(user_params)
    if User.find_by(email: @user.email)
      flash[:warning] = 'This email has been used. Try another email'
      redirect_to new_us_path
    elsif @user.save
      session[:user_id] = @user.id
      flash[:success] = "Welcome, #{@user.email}!"
      redirect_to adding_path
    else
      redirect_to new_us_path, notice: "Passwords don't match or login or password data exists"
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_url(@user), notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
