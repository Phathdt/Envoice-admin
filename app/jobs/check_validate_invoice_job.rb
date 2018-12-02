class CheckValidateInvoiceJob < ApplicationJob
  queue_as :default

  def perform(invoice)
    node = Nem::Node.new(host: ENV['NEM_HOST'])
    endpoint = Nem::Endpoint::Transaction.new(node)

    transaction = endpoint.find(invoice.transaction_id)

    message = transaction.message.value
    decode_message = message.scan(/../).map { |x| x.hex.chr }.join
    encode_data = Digest::SHA2.new(256).hexdigest invoice.hash_data

    account_endpoint = Nem::Endpoint::Account.new(node)
    account_nem = account_endpoint.find(invoice.company.public_address)

    (decode_message == encode_data) && ( account_nem.public_key == transaction.signer) ? invoice.validated! : invoice.not_validated!
  end
end
