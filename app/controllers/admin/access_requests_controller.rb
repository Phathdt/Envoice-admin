class Admin::AccessRequestsController < Admin::ApplicationController
  before_action :set_access_request, only: %i(show accept reject)

  def index
    @access_requests = AccessRequest.pending.order(:updated_at).page params[:page]
  end

  def show; end

  def accept
    if @access_request.may_approve?

      service.accept(@access_request)

      flash[:success] = t('.accept')
      redirect_to admin_access_requests_path
    end
  end

  def reject
    if @access_request.may_reject?
      @access_request.reject!
      @access_request.token = AccessRequest.generate_token
      @access_request.update(params_request)

      AccessRequestMailer.reject(
        @access_request, I18n.locale.to_s
      ).deliver_later

      flash[:success] = t('.reject')
      redirect_to admin_access_requests_path
    end
  end

  private

  def set_access_request
    @access_request = AccessRequest.find(params[:id])
  end

  def params_request
    params.require(:access_request).permit(:reason)
  end

  def service
    @service ||= Admin::AccessRequestService.new(current_user, I18n.locale)
  end
end
