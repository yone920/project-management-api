class LoginController < ApplicationController
  def create
    username = params[:account] + params[:username]
    if username[0..2] == "emp"
      user = Employee.find_by(username: username)
    elsif username[0..2] == "mag"
      user = Manager.find_by(username: username)
    end
    is_authenticated = user.authenticate(params[:password]) if user
    if is_authenticated
      render json: { token: encode_token(user) }
    else
      render json: { errors: ["Wrong username or password bud. Sorry!"] }, status: :unprocessable_entity
    end
  end

  def profile
    render json: user_atm
  end
end
