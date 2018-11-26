class Api::BaseService < BaseService
  attr_reader :params

  def render_response_error(error_code = RESPONSE_CODES[:unknown], message = '')
    if message.blank?
      { code: error_code }
    else
      {
        code: error_code,
        message: message
      }
    end
  end
end
