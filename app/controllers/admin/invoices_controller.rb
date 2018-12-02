class Admin::InvoicesController < Admin::ApplicationController
  def by_companies
    @search = Company.includes(:invoices, :invoices_suspended).order(:id).search(params[:q])
    @companies = @search.result.page params[:page]
  end

  def index
    @company = Company.find(params[:company_id])

    @search = @company.invoices.order(:id).search(params[:q])
    @invoices = @search.result.page params[:page]
  end

  def show
    @invoice = Invoice.find(params[:id])

    respond_to do |format|
      format.js { render 'show_modal' }
    end
  end
end
