# frozen_string_literal: true

class WorkDay < ApplicationRecord
  has_many :working_days, dependent: :destroy
  has_many :workers, through: :working_days
  has_many :reservations
end
