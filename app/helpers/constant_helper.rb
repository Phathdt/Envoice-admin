module ConstantHelper
  URL_HELPERS = Rails.application.routes.url_helpers

  SIDEBAR_LANDING = [
    ['dashboard', URL_HELPERS.admin_path(locale: I18n.locale)]
  ].freeze

  ACCESS_REQUEST = [
    ['access_requests', URL_HELPERS.admin_access_requests_path(locale: I18n.locale)]
  ].freeze

  DASHBOARD = [
    ['dashboard', URL_HELPERS.customer_path(locale: I18n.locale)]
  ].freeze

  API_KEY = [
    ['api_key', URL_HELPERS.customer_access_tokens_path(locale: I18n.locale)]
  ].freeze

  INVOICES = [
    ['invoice', URL_HELPERS.customer_invoices_path(locale: I18n.locale)]
  ].freeze
end
