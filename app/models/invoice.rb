class Invoice < ApplicationRecord
  belongs_to :company

  enum state: { approved: 0, suspended: 1 }
  enum nem_validate: { pending: 0, validated: 1, not_validated: 2 }

  has_one_attached :pdf

  after_create :check_nem_validate

  private

  def check_nem_validate
    CheckValidateInvoiceJob.set(wait: 600.seconds).perform_later(self)
  end
end
