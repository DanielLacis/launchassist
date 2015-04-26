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
    @project = Project.find(@tier.project_id)
    if @project.user_id == current_user.id && @tier.save
      render json: @tier
    else
      render json: @tier.errors.full_messages, status: 422
    end
  end

  def update
    @tier = Tier.find(params[:id])
    @project = Project.find(@tier.project_id)
    if @project.user_id != current_user.id
      render json: "Only project owner can edit tiers", status: 403
    elsif @tier.update(tier_params)
      render json: @tier
    else
      render json: @tier.errors.full_messages, status: 422
    end
  end

  def destroy
    @tier = Tier.find(params[:id])
    if @tier.destroy
      render json: @tier
    else
      render json: "something went wrong"
    end
  end

  private

  def tier_params
    params.require('tier').permit(:amount, :project_id, :rewards, :delivery_date);
  end
end
