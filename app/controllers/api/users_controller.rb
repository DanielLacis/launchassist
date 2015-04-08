class Api::CurrentUsersController < ApplicationController
  before_action :require_current_user!

  def show
    logged_in? ? (render 'current_user') : (render json: nil)
  end
end
