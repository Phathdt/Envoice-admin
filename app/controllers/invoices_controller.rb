class InvoicesController < ApplicationController
  def index
  end

  def search
    @invoice = Invoice.find_by(transaction_id: params[:invoice][:transaction_id])
  end
end
