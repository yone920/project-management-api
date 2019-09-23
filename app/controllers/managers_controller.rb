class ManagersController < ApplicationController
  def index
    managers = Manager.all
    render json: managers
  end
  def show
    manager = Manager.find_by(username: user_atm[:username])
    render json: manager, include: "**"
  end
end
