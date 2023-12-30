class TicketBookingConfirmationJob
  include Sidekiq::Job

  def perform_async(booking_id)
    booking = Booking.find_by(id: booking_id)
    if booking
      ticket = booking.ticket
      event = ticket.event
      user = booking.user

      puts "====Ticket has been Booked Successfully for the following event===="
      puts "\n"
      puts "Event Title: #{event.title} \n"
      puts "Event Date: #{event.event_date} \n"
      puts "Event Time: #{event.event_time} \n"
      puts "Event Venue: #{event.venue} \n"
      puts "Ticket Price: #{ticket.price} \n"
      puts "Ticket Quantity: #{booking.quantity} \n"
      puts "Total Price: #{booking.total_price} \n"
      puts "Ticket Availability: #{ticket.availability ? "Yes" : "No"} \n"
      puts "Booked By: #{user.first_name user.last_name}(#{user.email})"
      puts "==========================================="
    end
  end
end
