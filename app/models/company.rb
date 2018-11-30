class Company < ApplicationRecord
  belongs_to :user
  has_many :invoices, dependent: :destroy

  validates :name, presence: true
  validates :public_address, presence: true, length: { is: 40 }, uniqueness: true
  validates :phone_number, length: { minimum: 10, maximum: 11 }, presence: true
  validates :tax_identification_number, presence: true
  validates :address, presence: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
end
