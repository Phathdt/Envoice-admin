class Customer::InvoicesController < Customer::ApplicationController
  before_action :set_invoice, only: %i[show]

  def index
    @search = Invoice.search(params[:q])
    @invoices = @search.result.page params[:page]
  end

  def show
    respond_to do |format|
      format.html
      format.js { render 'show_modal' }
    end
  end

  private

  def set_invoice
    @invoice = Invoice.find(params[:id])
  end

end
