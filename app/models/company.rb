class Company < ApplicationRecord
  belongs_to :owner, class_name: 'User', foreign_key: 'user_id'
  has_many :staffs, class_name: 'User', foreign_key: 'company_id'
  has_many :products, dependent: :destroy
  has_many :invoices, dependent: :destroy
  has_many :customers, dependent: :destroy
  has_one :account

  validates :phone_number, length: { minimum: 10, maximum: 11 }, presence: true
end
