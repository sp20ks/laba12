# frozen_string_literal: true

# class of controller
class UsersController < ApplicationController
  before_action :set_user, only: %i[edit update destroy]

  def index; end

  def show
    @users = User.all
  end

  # GET /users/new
  def new
    @user = User.new
  end

  def edit; end

  # rubocop:disable Metrics/AbcSize
  def create
    @user = User.new(user_params)
    if !@user.save
      flash[:warning] = @user.errors.full_messages.join(' and ')
      redirect_to new_us_path
    else
      session[:user_id] = @user.id
      flash[:success] = "Welcome, #{@user.email}!"
      redirect_to adding_path
    end
  end
  # rubocop:enable Metrics/AbcSize

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_url(@user), notice: 'User was successfully updated.' }
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
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
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
