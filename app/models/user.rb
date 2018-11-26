class User < ApplicationRecord
  devise  :invitable,
          :database_authenticatable,
          :recoverable,
          :rememberable,
          :validatable,
          :async
  include DeviseTokenAuth::Concerns::User

  enum role: { client: 0, admin: 1 }

  before_create :ensure_access_token

  has_one :company

  def active_for_authentication?
    super && !blocked
  end

  def ensure_access_token
    if access_token.blank?
      self.access_token = generate_access_token
    end
  end

  def generate_access_token
    loop do
      token = Devise.friendly_token.upcase
      break token unless User.where(access_token: token).first
    end
  end

  def change_access_token
    self.update(access_token: generate_access_token)
  end
end
