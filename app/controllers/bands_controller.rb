# frozen_string_literal: true

class BandsController < ApplicationController
  before_action :authorize
  before_action :set_band, only: %i[ show update destroy ]

  def index
    @bands = Band.all

    render json: @bands
  end

  def show
    render json: @band
  end

  def create
    @band = @user.bands.new(band_params)

    if @band.save
      render json: @band, status: :created, location: @band
    else
      render json: @band.errors, status: :unprocessable_entity
    end
  end

  def update
    if @band.update(band_params)
      render json: @band
    else
      render json: @band.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @band.destroy
  end

  private

  def set_band
    @band = @user.bands.find(params[:id])
  end

  def band_params
    params.require(:band).permit(:name, :user_id)
  end
end
