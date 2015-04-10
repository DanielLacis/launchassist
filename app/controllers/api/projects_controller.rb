class Api::ProjectsController < ApplicationController
  before_action :require_current_user!

  def index
    @projects = Project.where(category_id: params[:category_id]).order(end_date: :asc)
    render :index
  end

  def show
    @project = Project.find(params[:id])
    render :show
  end
end
