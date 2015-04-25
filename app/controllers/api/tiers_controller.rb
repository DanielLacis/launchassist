class Api::TiersController < ApplicationController
  before_action :require_current_user!

  def index
    @tiers = Tier.where(project_id: params[:project_id]).order(amount: :asc)
    render :index
  end

  def show
    @tier = Tier.find(params[:id])
    render :show
  end

  def create
    @tier = Tier.new(tier_params)
    if @tier.save
      render json: @tier
    else
      render json: @tier.errors.full_messages, status: 422
    end
  end

  private

  def tier_params
    params.require('tier').permit(:amount, :project_id, :rewards, :delivery_date);
  end
end
