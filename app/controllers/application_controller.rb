# frozen_string_literal: true

class ApplicationController < ActionController::API
  def encode(payload)
    JWT.encode(payload, 'secret')
  end

  def decode_token
    auth_header = request.headers['Authorization']
    if auth_header
      token = auth_header.split(' ').last
      begin
        JWT.decode(token, 'secret', true, algorithm: 'HS256')
      rescue JWT::DecodeError
        nil
      end
    end
  end
  
  def authorized_user
    decoded_token = decode_token()
    if decoded_token
      user_id = decoded_token[0]['user_id']
      @user = User.find_by(id: user_id)
    end
  end

  def authorize
    render json: {message: 'You must be authorized.'}, status: :unauthorized unless authorized_user && authorized_user.admin?
  end
end

#m eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyfQ.0NAXbbVzeMaKZAl8HdOq3JcgIDf5xpGF2rkg5frw6FE
#u eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxfQ.ETUYUOkmfnWsWIvA8iBOkE2s1ZQ0V_zgnG_c4QRrhbg
