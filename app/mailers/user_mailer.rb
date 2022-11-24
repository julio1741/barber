# frozen_string_literal: true

class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def reset_password
    @user = params[:user]
    @friendly_password = params[:friendly_password]
    mail(to: @user.email, subject: 'Reinicio de contraseña') if @user.email.present?
  end
end
