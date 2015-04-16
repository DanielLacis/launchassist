class Api::PledgesController < ApplicationController
  def index

  end

  def show
    @pledge = Pledge.find(params[:id])
  end

  def create
    new_params = pledge_params
    new_params[:user_id] = current_user.id
    @pledge = Pledge.new(new_params)
    if @pledge.save
      render json: @pledge
    else
      render json: @pledge.errors.full_messages, status: 422
    end
  end

  def destroy
    @pledge = Pledge.find(params[:id])
    if @pledge.destroy
      render json: @pledge
    end
  end

  private

  def pledge_params
    params.require('pledge').permit(:tier_id)
  end
end
