module ConstantHelper
  URL_HELPERS = Rails.application.routes.url_helpers

  SIDEBAR_LANDING = [
    ['dashboard', URL_HELPERS.admin_path(locale: I18n.locale)]
  ].freeze

  ACCESS_REQUEST = [
    ['access_requests', URL_HELPERS.admin_access_requests_path(locale: I18n.locale)]
  ].freeze
end
