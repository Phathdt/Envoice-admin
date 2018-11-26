class Api::BaseApiController < ActionController::Base
  respond_to :json
  skip_before_action :verify_authenticity_token
  before_action :api_authenticate_user!

  protected

  def api_authenticate_user!
    render_error(RESPONSE_CODES[:token_invalid]) && return unless get_access_token
    @current_user = User.find_by(access_token: get_access_token)
    render_error RESPONSE_CODES[:authentication_invalid] unless @current_user
  end

  def current_user
    @current_user ||= User.find_by(access_token: get_access_token)
  end

  def get_access_token
    auth_token = request.headers['accessToken']
  end

  private

  def render_error(error_code = RESPONSE_CODES[:unknown], message = '')
    if message.blank?
      render json: {
        code: error_code
      }
    else
      render json: {
        code: error_code,
        message: message
      }
    end
  end
end
