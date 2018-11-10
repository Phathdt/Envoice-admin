class User < ApplicationRecord
  devise :invitable, :database_authenticatable, :recoverable, :rememberable,
          :validatable, :invitable, :async

  enum role: { admin: 0, client: 1 }

  has_one :owner_company, class_name: 'Company', foreign_key: 'user_id'
  belongs_to :company, optional: true

  def active_for_authentication?
    super && !blocked
  end
end
