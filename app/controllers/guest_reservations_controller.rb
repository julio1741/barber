# frozen_string_literal: true

class GuestReservationsController < ReservationsController
  skip_before_action :authorize_request
  def reservation_params
    params.permit(:firstname, :lastname, :phone, :day, :rut, :email,
                                        :block_time_id, :user_id, :work_day_id, :worker_id, :service_id, :organization_id)
  end
end