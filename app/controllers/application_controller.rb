class ApplicationController < ActionController::API
  def encode_token(user)
    payload = { user_name: user.username }
    JWT.encode(payload, secret, 'HS256')
  end

  def secret
    "longlivethepegasus"
  end

  # def secret
  #   Rails.application.credentials.jwt_secret
  # end

  def token
    request.headers["Authorization"]
  end

  def decoded_token
    JWT.decode(token, secret, true, { algorithm: 'HS256' })
  end

  def user_atm
    user_name = decoded_token[0]["user_name"]
    if user_name[0..2] == "emp"
      user = Employee.find_by(username: user_name)
    elsif user_name[0..2] == "mag"
      user = Manager.find_by(username: user_name)
    end
    return {username: user.username}
  end

end
