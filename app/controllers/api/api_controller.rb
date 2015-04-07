module Api
  class ApiController < ApplicationController
    before_action :require_current_user!

    def require_current_user!
      unless signed_in?
        render json: ["You must be signed in to access this"], status: :unauthorized
      end
    end
  end
end
