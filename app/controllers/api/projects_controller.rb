class Api::ProjectsController < ApplicationController
  before_action :require_current_user!

  def create
    new_params = project_params;
    new_params[:user_id] = current_user.id
    @project = Project.new(new_params);
    if @project.save
      render json: @project
    else
      render json: @project.errors.full_messages, status: :unprocessable_entity
    end
  end

  def index
    @projects = Project.where(category_id: params[:category_id]).order(end_date: :asc)
    render :index
  end

  def show
    @project = Project.find(params[:id])
    render :show
  end

  private

  def project_params
    params.require('project').permit(:category_id, :title, :image_url, :description, :end_date, :goal, :main_photo)
  end
end
