# frozen_string_literal: true

class ReservationsController < ApiController
  before_action :set_reservation, only: %i[show update destroy]
  before_action :authorize_request

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
    @reservations = Reservation.where(email: by_user_params[:email]).order(day: :desc)
    now = Time.now
    @old_reservations = @reservations.where("reservations.day < ?", now)
    @current_reservations = @reservations.where("reservations.day >= ? ", now).order(day: :desc).sort_by(&:day)
  end

  # POST /reservations or /reservations.json
  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.change_day_time
    if @reservation.save
      render json: @reservation, status: :created
    else
      render json: @reservation.errors.full_messages, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /reservations/1 or /reservations/1.json
  def update
    if @reservation.update(reservation_params)
      @reservation.reload.change_day_time
      render json: @reservation, status: :created
    else
      render json: @reservation.errors, status: :unprocessable_entity
    end
  end

  # DELETE /reservations/1 or /reservations/1.json
  def destroy
    email = @reservation.user.try(:email) || @reservation.try(:email)
    if email
      if @reservation.destroy
        ReservationMailer.with(reservation: @reservation).cancel.deliver_now
        render json: { reservation_id: @reservation.id, message:"Borrada con éxito!" }, status: :ok
      else
        render json: @reservation.errors, status: :unprocessable_entity
      end
    else
      render json: {error: "Reserva y usuario no tienen correo asociado"}, status: :unprocessable_entity
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def reservation_params
    params.require(:reservation).permit(:firstname, :lastname, :phone, :day, :rut, :email,
                                        :block_time_id, :user_id, :work_day_id, :worker_id, :service_id, :organization_id)
  end

  def by_user_params
    params.permit(:user_id, :email)
  end

end
