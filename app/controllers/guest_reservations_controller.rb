# frozen_string_literal: true

class GuestReservationsController < ReservationsController
  def reservation_params
    params.permit(:firstname, :lastname, :phone, :day, :rut, :email,
                                        :block_time_id, :user_id, :work_day_id, :worker_id, :service_id)
  end
end