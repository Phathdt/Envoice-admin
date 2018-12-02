class Api::V1::InvoiceService < Api::V1::BaseService
  def create(params)
    invoice = current_user.company.invoices.new(params)

    if invoice.save
      {
        code: RESPONSE_CODES[:request_success],
        id: invoice.id
      }
    else
      render_response_error(
        RESPONSE_CODES[:validation_error],
        invoice.errors.full_messages
      )
    end
  end

  def cancle id
    invoice = Invoice.find(id)
    invoice.suspended!

    {
      code: RESPONSE_CODES[:request_success]
    }
  end
end
