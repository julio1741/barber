class ApiController < ActionController::API
  def not_found
    render json: { error: 'not_found' }
  end

  def authorize_request
    header = request.headers['Authorization']
    header = header.split(' ').last if header
    begin
      @decoded = JsonWebToken.decode(header)
      @current_user = User.find(@decoded[:user_id])
    rescue ActiveRecord::RecordNotFound => e
      render json: { errors: e.message }, status: :unauthorized
    rescue JWT::DecodeError => e
      render json: { errors: e.message }, status: :unauthorized
    end
  end

  def worker_availability(day, worker)
    day_date = Date.parse(day).strftime('%A').downcase
    worker_working_day = selected_work_day(day_date, worker)
    return [[], nil] if worker_working_day.nil?

    # remove reserved block times
    reservations = Reservation.joins(:worker, :block_time, :work_day).where(worker_id: worker.id,
                                                                            work_day: { name: day_date })
    reserved_block_times = reservations.map(&:block_time)
    [(worker.block_times - reserved_block_times), worker_working_day]
  end

  def selected_work_day(day, worker)
    worker.work_days.find_by(name: day)
  end

end
