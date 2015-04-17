class Api::CommentsController < ApplicationController
  def index
    @comments = Comment.includes(:user).where(project_id: params[:project_id]).order(created_at: :desc)
    render :index
  end

  def show
    @comment = Comment.includes(:user).find(params[:id])
    render :show
  end

  def create
    new_params = comment_params
    new_params[:user_id] = current_user.id
    @comment = Comment.new(new_params)
    if @comment.save
      render :json => @comment.as_json.merge({user: {id: @comment.user.id, username: @comment.user.username}})
    else
      render json: @comment.errors.full_messages, status: 422
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if !@comment
      render json: "comment not found", status: 404
    elsif @comment.user_id != current_user.id
      render json: "Only the comment owner can delete this comment", status: 403
    else
      @comment.destroy
      render json: @comment
    end
  end

  def update

  end

  private

  def comment_params
    params.require('comment').permit(:project_id, :body)
  end
end
