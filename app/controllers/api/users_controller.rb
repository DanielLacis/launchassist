class Api::UsersController < ApplicationController
  def show
    logged_in? ? (render :show) : (render json: nil)
  end
end
