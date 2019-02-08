class AccessRequest < ApplicationRecord
  include AASM

  enum state: { pending: 0, suspended: 1, approved: 2 }

  aasm column: 'state', enum: true do
    state :pending, initial: true
    state :approved, :suspended

    event :approve do
      transitions from: :pending, to: :approved
    end

    event :reject do
      transitions from: :pending, to: :suspended
    end

    event :repending do
      transitions from: :suspended, to: :pending
    end
  end

  has_one_attached :business_registration_certificate
  has_one_attached :certificate_of_tax_registration
  has_one_attached :id_legal_representative_front
  has_one_attached :id_legal_representative_back

  validates_file :business_registration_certificate
  validates_file :certificate_of_tax_registration
  validates_file :id_legal_representative_front
  validates_file :id_legal_representative_back

  validates :company_name, presence: true
  validates :legal_representative, presence: true
  validates :public_address, presence: true, length: { is: 40 }, uniqueness: true
  validates :phone_number, length: { minimum: 10, maximum: 11 }, presence: true
  validates :tax_identification_number, presence: true
  validates :address, presence: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  def image_present?
    self.business_registration_certificate.attached? &&
      self.certificate_of_tax_registration.attached? &&
      self.id_legal_representative_front.attached? &&
      self.id_legal_representative_back.attached?
  end

  class << self
    def generate_token
      loop do
        token = Devise.friendly_token
        break token unless AccessRequest.where(token: token).first
      end
    end
  end
end
