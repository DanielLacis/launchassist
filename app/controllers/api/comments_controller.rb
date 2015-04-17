class Api::CommentsController < ApplicationController
  def index
    @comments = Comment.where(project_id: params[:project_id]).order(created_at: :desc)
    render :index
  end

  def show
    @comment = Comment.find(params[:id])
    render :show
  end

  def create

  end

  def destroy

  end

  def update

  end
end
