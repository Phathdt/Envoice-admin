class Customer::AccessTokensController < Customer::ApplicationController
  def index; end

  def reset
    current_user.change_access_token
    redirect_to customer_access_tokens_path
  end

end
