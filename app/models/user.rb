class User < ApplicationRecord
  devise  :invitable,
          :database_authenticatable,
          :recoverable,
          :rememberable,
          :validatable,
          :async
  include DeviseTokenAuth::Concerns::User

  enum role: { client: 0, admin: 1 }

  has_one :company

  def active_for_authentication?
    super && !blocked
  end
end
