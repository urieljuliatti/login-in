require 'jwt'

def token(user)
  secret = 'secret'
  encoding = 'HS256'
  JWT.encode({ user_id: user.id }, secret, encoding)
end
