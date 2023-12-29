class EventsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_event, only: [:update, :show, :destroy]
  before_action :validate_user_role

  def index
    events = current_user.events
    if events.present?
      render json: events, status: 200
    else
      render json: { message: 'No events found' }, status: 200
    end
  end

  def create
    event = current_user.events.create(event_params)
    if event
      render json: event, status: 200
    else
      render json: { message: event.errors.full_messages.join(",") }, status: 422
    end
  end
  
  def show
    render json: @event, status: 200
  end

  def update
    if @event.update(event_params)
      render json: { message: 'Event Updated Successfully' }, status: 200
    else
      render json: { message: @event.errors.full_messages.join(",") }, status: 422
    end
  end

  def destroy
    if @event.destroy
      render json: { message: 'Event Deleted Successfully' }, status: 200
    else
      render json: { message: @event.errors.full_messages.join(",") }, status: 422
    end
  end

  private

  def event_params
    params.require(:event).permit(:title, :event_date, :event_time, :venue)
  end

  def set_event
    @event = Event.find_by(id: params[:id])
    unless @event
      render json: {
        data: {
          errors: "Event not Found with this ID #{params[:id]}"
        }
      }, status: 404
    end
  end

  def validate_user_role
    if current_user.role == "Customer"
      render json: {
        data: {
          errors: "User doest not have permission to READ/WRITE Events"
        }
      }, status: 403
    end
  end
end