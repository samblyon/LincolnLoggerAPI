class Api::LogsController < ApplicationController
  before_action :block_unless_validated

  def index
    render json: current_user.logs
  end

  def create
    render json: current_user.logs.create!
  end
end
