class CheckValidateInvoiceJob < ApplicationJob
  queue_as :default

  def perform(invoice)
    node = Nem::Node.new(host: ENV['NEM_HOST'])
    endpoint = Nem::Endpoint::Transaction.new(node)

    transaction = endpoint.find(Invoice.last.transaction_id)

    message = transaction.message.value

    decode_message = message.scan(/../).map { |x| x.hex.chr }.join

    encode_data = Digest::SHA2.new(256).hexdigest invoice.hash_data

    decode_message == encode_data ? invoice.validated! : invoice.not_validated

  end
end
