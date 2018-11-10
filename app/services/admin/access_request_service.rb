class Admin::AccessRequestService < Admin::BaseService
  COMPANY_ATTRIBUTE = %i(company_name legal_representative phone_number tax_identification_number address email public_address).freeze

  def accept(access_request)
    access_request.approve!

    user = create_user(access_request)

    company = create_company(user, access_request)

    AccessRequestMailer.accept(
      access_request, user, user.raw_invitation_token, locale
    ).deliver_later
  end

  private

  def create_user(request)
    User.invite!(
      email: request.email,
      name: request.legal_representative,
      skip_invitation: true
    )
  end

  def create_company(user, request)
    params = request.slice(COMPANY_ATTRIBUTE)
    params['name'] = params.delete('company_name')
    user.create_company(params)
  end
end
