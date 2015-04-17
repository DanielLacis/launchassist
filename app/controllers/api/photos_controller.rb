class Api::PhotosController < ApplicationController
  before_action :require_current_user!

  def create
    @photo = Photo.new(photo_params);
    @project = Project.find(photo_params[:project_id])

    if @project.user_id == current_user.id
      if @photo.save
        render json: @photo
      else
        render json: @photo.errors.full_messages, status: :unprocessable_entity
      end
    else
      render json: "Photos can only be uploaded by project owner", status: 403
    end
  end

  def index
    @photos = Photo.where(project_id: params[:project_id]).order(created_at: :desc)
    render :index
  end

  def update
    @photo = Photo.find(params[:id]);
    @project = Project.find(photo_params[:project_id])
    if @project.user_id == current_user.id
      if @project.update(photo_params)
        render json: @project
      else
        render json: @project.errors.full_messages, status: :unprocessable_entity
      end
    else
      render json: "Photos can only be uploaded by project owner", status: 403
    end
  end

  def destroy
    @photo = Photo.find(params[:id])
    if @photo
      @project = Project.find(@photo.project_id)
      if @project.user_id == current_user.id
        @photo.destroy
        render json: @photo
      else
        render json: "Only project owner can delete photos", status: 403
      end
    else
      render json: "Photo not found", status: 404
    end
  end

  private

  def photo_params
    params.require('photo').permit(:sub_photo, :project_id, :sub_photo_file_name, :sub_photo_content_type, :sub_photo_file_size, :sub_photo_updated_at)
  end
end
