class Api::V1::InvoicesController < Api::V1::BaseApiController

  def create
    data = invoice_service.create invoice_params

    render json: data
  end

  def cancle
    data = invoice_service.cancle params[:id]

    render json: data
  end

  private

  def invoice_params
    params.require(:invoice).permit(:form_identifier, :serial_number, :invoice_number,:invoice_date, :payment_method, :vat_percent, :transaction_id, :hash_data, :pdf, :customer_name, :paid_amount)
  end

  def invoice_service
    @invoice_service ||= Api::V1::InvoiceService.new(current_user)
  end
end
