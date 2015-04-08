class Api::UsersController < ApplicationController
  def show

    if current_user
      render :show
    else
      render json: nil
    end
  end
end
