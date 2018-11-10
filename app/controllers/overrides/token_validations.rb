module Overrides
  class TokenValidationsController < DeviseTokenAuth::SessionsController
    skip_before_action :verify_authenticity_token
    include DeviseTokenAuth::Concerns::SetUserByToken
  end
end
