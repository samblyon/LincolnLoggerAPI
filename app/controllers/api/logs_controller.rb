class Api::LogsController < ApplicationController
  before_filter :validated?

  def index
    render json: current_user.logs
  end

  def create
    render json: current_user.logs.create!
  end
end
