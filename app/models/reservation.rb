# frozen_string_literal: true

class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :block_time
  belongs_to :work_day
  belongs_to :worker
  belongs_to :service

  #validates_with RutValidator
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :firstname, presence: true
#  validates :rut, presence: true
  validates :day, presence: true
  validates :work_day_id, presence: true
  validates :block_time_id, presence: true
  validates :worker_id, presence: true
  #validates :phone,  presence: true,
  #                   numericality: true,
  #                   length: { minimum: 10, maximum: 15 }
  validates_uniqueness_of :worker_id, scope: %i[day work_day_id block_time_id],
                                      message: 'is busy, pick another block'

  scope :by_user, ->(user_id) { where(user_id: user_id) }
  scope :actives, -> { where('day > ?', Time.zone.now) }

  def change_day_time
    datetime_block_time = block_time.start.to_datetime
    start_time_hour = datetime_block_time.hour
    start_time_minutes = datetime_block_time.min
    start_time_seconds = datetime_block_time.second
    self.day = self.day.change({ hour: start_time_hour, min: start_time_minutes, sec: start_time_seconds })
    save unless self.new_record?
  end
  #after_create :send_email

  #def send_email
    #ReservationMailer.with(reservation: self).success.deliver_now
  #end
end
