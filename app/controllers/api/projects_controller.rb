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

  def update
    @project = Project.find(params[:id])
    if current_user.id != @project.user_id
      render json: 'Can only be edited by project owner', status: 403
    elsif @project.update(project_params)
      render json: @project
    else
      render json: @project.errors.full_messages, status: :unprocessible_entity
    end
  end

  private

  def project_params
    params.require('project').permit(:category_id, :title, :description, :end_date, :goal, :main_photo, :main_photo_file_name, :main_photo_content_type, :main_photo_file_size, :main_photo_updated_at)
  end
end
