class User < ApplicationRecord
  include Organizationable
  has_secure_password
  #mount_uploader :avatar, AvatarUploader
  validates :email, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password,
            length: { minimum: 6 },
            if: -> { new_record? || !password.nil? }
  validates :password, confirmation: {case_sensitive: true}

  has_many :reservations
end