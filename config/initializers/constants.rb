ALERT_TYPE = {
  'alert' => 'warning',
  'notice' => 'info',
  'success' => 'success'
}.freeze

ALERT_ICON = {
  'alert' => 'ni-support-16',
  'notice' => 'ni-bell-55',
  'success' => 'ni-like-2'
}.freeze

PAYMENT_METHOD = {
  0 => 'TM/CK',
  1 => 'Thanh toán tiền mặt',
  2 => 'Thanh toán chuyển khoản',
  3 => 'Thanh toán thẻ tín dụng',
  4 => 'Thanh toán bù trừ'
}

RESPONSE_CODES = {
  request_success:           '0000',

  params_missing:            '0001',
  validation_error:          '0002',
  url_not_found:             '0003',
  record_not_found:          '0004',
  access_denied:             '0005',
  params_invalid:            '0006',
  item_not_found:            '0007',

  token_invalid:             '0100',
  authentication_invalid:    '0101',
  email_taken:               '0102',
  login_wrong:               '0103',
  email_not_found:           '0104',
  password_wrong:            '0105',
  account_unconfirmed:       '0106',
  current_password_invalid:  '0107',


  unknown:                   '9999'
}.freeze
