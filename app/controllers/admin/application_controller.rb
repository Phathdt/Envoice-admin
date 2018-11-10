class Admin::ApplicationController < ApplicationController
  layout 'admin'
  before_action :authorize_admin!

  private

  def authorize_admin!
    authenticate_user!

    render 'errors/not_found' unless current_user.admin?
  end
end
