# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authorize, except: :login

  def create
    @new_user = User.new(user_params)
    if @new_user.valid? && authorized_user.admin?
      @new_user.save
      token = encode({ user_id: @new_user.id })
      render json: { user: @new_user, token: token }, status: :created
    else
      render json: { error: 'Invalid user data or duplicated presences.'}, status: :unprocessable_entity
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
