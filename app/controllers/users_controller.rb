# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authorize, except: :login

  def create
    @user = User.create(user_params)
    if @user && @user.valid? 
      token = encode({ user_id: @user.id })
      render json: { user: @user, token: token }, status: :ok
    else
      render json: { error: 'Invalid User or Password'}, status: :unprocessable_entity
    end
  end

  def index
    @users = User.all
    render json: { users: @users }, status: :ok
  end

  def login
    @user = User.find_by(username: user_params[:username])
    if @user && @user.authenticate(user_params[:password])
      token = encode({ user_id: @user.id })
      render json: { user: @user, token: token }, status: :ok
    else
      render json: { error: 'Invalid User or Password'}, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.permit(:name, :username, :password, :password_digest, :admin)
  end
end
