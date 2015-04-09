class Api::CategoriesController < ApplicationController
  before_action :require_current_user!

  def index
    @categories = Category.all
    render :index
  end

  def show
    @category = Category.find(params[:id])
    render :show
  end
end
