# frozen_string_literal: true

class BlockTime < ApplicationRecord
  has_many :working_hours, dependent: :destroy
  has_many :workers, through: :working_hours
  has_many :reservations
end
