class JsonWebToken
  if Rails.env.production?
    HMAC_SECRET = Rails.application.secret_key_base
  else
    HMAC_SECRET = Rails.application.secrets.secret_key_base
  end

  def self.encode(payload, exp = 24.hours.from_now)
    payload[:exp] = exp.to_i

    JWT.encode(payload, HMAC_SECRET)
  end

  def self.decode(token)
    body = JWT.decode(token, HMAC_SECRET)
    HashWithIndifferentAccess.new body
  rescue JWT::DecodeError => e

    raise ExceptionHandler::InvalidToken, e.message
  end
end
