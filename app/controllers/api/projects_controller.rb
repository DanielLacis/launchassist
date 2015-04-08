class Api::ProjectsController < ApplicationController
  before_action :require_current_user!
end
