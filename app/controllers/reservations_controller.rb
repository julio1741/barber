# frozen_string_literal: true

class ReservationsController < ApiController
  before_action :set_reservation, only: %i[show update destroy]

  # GET /reservations or /reservations.json
  def index
    @reservations = Reservation.limit(params[:limit]).offset(params[:offset])
    render json: @reservations, status: :ok
  end

  # GET /reservations/1 or /reservations/1.json
  def show
    render json: @reservation, status: :ok
  end

  # GET /reservations/1 or /reservations/1.json
  def by_user
    @reservations = Reservation.by_user(by_user_params[:user_id]).order(day: :desc)
    now = Time.now
    @old_reservations = @reservations.where("reservations.day < ?", now)
    @current_reservations = @reservations.where("reservations.day >= ? ", now).sort_by(&:day)
  end

  # POST /reservations or /reservations.json
  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.change_day_time
    if @reservation.save
      render json: @reservation, status: :created
    else
      render json: @reservation.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /reservations/1 or /reservations/1.json
  def update
    if @reservation.update(reservation_params)
      render json: @reservation, status: :created
    else
      render json: @reservation.errors, status: :unprocessable_entity
    end
  end

  # DELETE /reservations/1 or /reservations/1.json
  def destroy
    @reservation.destroy
    render json: { }
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def reservation_params
    params.require(:reservation).permit(:firstname, :lastname, :phone, :day, :rut, :email,
                                        :block_time_id, :user_id, :work_day_id, :worker_id, :service_id)
  end

  def by_user_params
    params.permit(:user_id)
  end

end
