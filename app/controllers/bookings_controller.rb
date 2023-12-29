class BookingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_booking, only: [:update, :show, :destroy]
  before_action :validate_user_access
  
  def index
    bookings = current_user.bookings
    if bookings.present?
      render json: bookings, status: 200
    else
      render json: { message: 'No bookings found' }, status: 200
    end
  end

  def create
    booking = current_user.bookings.create(booking_params)
    if booking
      render json: booking, status: 200
    else
      render json: { message: booking.errors.full_messages.join(",") }, status: 422
    end
  end
  
  def show
    render json: @booking, status: 200
  end

  def update
    if @booking.update(booking_params)
      render json: { message: 'Booking Updated Successfully' }, status: 200
    else
      render json: { message: @booking.errors.full_messages.join(",") }, status: 422
    end
  end

  def destroy
    if @booking.destroy
      render json: { message: 'Booking Deleted Successfully' }, status: 200
    else
      render json: { message: @booking.errors.full_messages.join(",") }, status: 422
    end
  end
  
  private
  
  def booking_params
    params.require(:booking).permit(:ticket_id)
  end

  def set_booking
    @booking = Booking.find_by(id: params[:id])
    unless @booking
      render json: {
        data: {
          errors: "Booking not Found with this ID #{params[:id]}"
        }
      }, status: 404
    end
  end

  def validate_user_access
    if current_user.role == "Event Organizer"
      render json: {
        data: {
          errors: "User doest not have permission to READ/WRITE Bookings"
        }
      }, status: 403
    end
  end
end