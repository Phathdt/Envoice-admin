class Api::V1::InvoicesController < Api::V1::BaseApiController

  def create
    data = invoice_service.create invoice_params

    render json: data
  end


  private

  def invoice_params
    params.require(:invoice).permit(:token)
  end

  def invoice_service
    @invoice_service ||= Api::V1::InvoiceService.new(current_user)
  end
end
