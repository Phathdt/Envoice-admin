class AccessRequestsController < ApplicationController
  layout 'devise'

  def new
    @access_request = AccessRequest.new
  end

  def create
    @access_request = AccessRequest.new(access_request_params)

    if @access_request.save
      flash[:success] = t('.created_success')
      render 'success'
    else
      render :new
    end
  end

  def edit
    @access_request = AccessRequest.find_by!(edit_params)
  end

  def update
    @access_request = AccessRequest.find_by(id: params[:id], token: params['access_request']['token'])

    if @access_request.update(access_request_params) && @access_request.may_repending?
      @access_request.repending!
      @access_request.update(reason: nil, token: nil)

      flash[:success] = t('.updated_success')
      render 'success'
    else
      render :edit
    end
  end

  private

  def access_request_params
    params.require(:access_request).permit(:company_name, :legal_representative, :phone_number, :tax_identification_number, :address, :email, :user_id, :business_registration_certificate, :certificate_of_tax_registration, :id_legal_representative_front, :id_legal_representative_back)
  end

  def edit_params
    params.permit(:id, :token)
  end
end
