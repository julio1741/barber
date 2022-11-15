# frozen_string_literal: true

class ReservationsController < ApplicationController
  before_action :set_reservation, only: %i[show update destroy]

  # GET /reservations or /reservations.json
  def index
    @reservations = Reservation.actives
    render json: @reservations, status: :ok
  end

  # GET /reservations/1 or /reservations/1.json
  def show
    render json: @reservation, status: :ok
  end

  # POST /reservations or /reservations.json
  def create
    @reservation = Reservation.new(reservation_params)

    respond_to do |format|
      @reservation.validate
      if @reservation.save
        format.json { render :show, status: :created, location: @reservation }
      else
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reservations/1 or /reservations/1.json
  def update
    respond_to do |format|
      @reservation.validate
      if @reservation.update(reservation_params)
        format.json { render :show, status: :ok, location: @reservation }
      else
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reservations/1 or /reservations/1.json
  def destroy
    @reservation.destroy
    respond_to do |format|
      format.json { head :no_content }
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
                                        :block_time_id, :user_id, :work_day_id, :worker_id)
  end

end
