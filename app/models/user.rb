class User < ApplicationRecord
  has_secure_password
  #mount_uploader :avatar, AvatarUploader
  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password,
            length: { minimum: 6 },
            if: -> { new_record? || !password.nil? }
  validates :password_confirmation, presence: true
  validates :password, confirmation: {case_sensitive: true}

  has_many :reservations
end