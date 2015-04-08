class Api::CategoriesController < ApplicationController
  before_action :require_current_user!

  def index
    @categories = Category.all
    render json: @categories
  end

  def show
    @category = Category.find(params[:id])
    if @category
      render :show
    end
  end
end
