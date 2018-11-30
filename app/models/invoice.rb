class Invoice < ApplicationRecord
  belongs_to :company

  enum state: { pending: 0, suspended: 1, approved: 2 }

  has_one_attached :image
  has_one_attached :pdf

end
