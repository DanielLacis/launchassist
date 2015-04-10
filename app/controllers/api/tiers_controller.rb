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
end
