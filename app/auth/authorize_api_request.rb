require "jwt"

class AuthorizeApiRequest
  def initialize(headers = {})
    @headers = headers
  end

  def call
    {
      user: user
    }
  end

  private

  attr_reader :headers
  HMAC_SECRET = Rails.application.secrets.secret_key_base
  
  def user
    @user = User.find(id) if decoded_auth_token

    
  rescue ActiveRecord::RecordNotFound => e

    raise(
      ExceptionHandler::InvalidToken,
      ("#{Message.invalid_token} #{e.message}")
    )
  end

  def decoded_auth_token
    @decoded_auth_token = JWT.decode(http_auth_header, HMAC_SECRET)
  end

  def id
    decoded_auth_token[0]['user_id']
  end

  def http_auth_header
    if headers['Authorization'].present?
      return headers['Authorization'].split(' ').last
    end
      raise(ExceptionHandler::MissingToken, Message.missing_token)
  end
end
