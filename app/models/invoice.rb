class Invoice < ApplicationRecord
  belongs_to :company

  enum state: { processing: 0, approved: 1 }
  enum nem_validate: { pending: 0, validated: 1, not_validated: 2 }

  has_one_attached :image
  has_one_attached :pdf

end
