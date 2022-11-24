# frozen_string_literal: true

class ReservationMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def success
    @reservation = params[:reservation]
    @user = @reservation.user
    @worker = @reservation.worker
    @work_day = @reservation.work_day
    @block_time = @reservation.block_time
    app_host = ENV.fetch('APP_HOST', nil)
    mail(to: @user.email, subject: 'Gracias por reservar!')
  end

  def cancel
    @reservation = params[:reservation]
    @user = @reservation.try(:user)
    email = @user.nil? ? @reservation.email : @user.try(:email)
    @worker = @reservation.worker
    @work_day = @reservation.work_day
    @block_time = @reservation.block_time
    app_host = ENV.fetch('APP_HOST', nil)
    mail(to: email, subject: 'Gracias por reservar!') if email.present?
  end
end
