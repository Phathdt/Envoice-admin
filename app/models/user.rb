class User < ApplicationRecord
  devise :invitable, :database_authenticatable, :recoverable, :rememberable,
          :validatable, :invitable, :async

  enum role: { admin: 0, client: 1 }

  has_one :company

  def active_for_authentication?
    super && !blocked
  end
end
