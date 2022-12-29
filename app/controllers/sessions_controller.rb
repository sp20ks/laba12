# frozen_string_literal: true

# class of controller
class SessionsController < ApplicationController
  before_action :no_autorize, only: %i[new create]
  before_action :autorize, only: :destroy

  def new; end

  # rubocop:disable Metrics/AbcSize
  def create
    @user = User.find_by(email: params[:email])
    if !!@user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:success] = 'you have successfully logged in'
      redirect_to adding_path
    else
      flash[:notice] = 'Incorrect password or email'
      redirect_to home_path
    end
  end
  # rubocop:enable Metrics/AbcSize

  def destroy
    session.delete :user_id
    flash[:success] = 'Successful exit'
    redirect_to home_path
  end
end
