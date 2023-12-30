class EventUpdateNotificationJob
  include Sidekiq::Job

  def perform(event_id, customer_ids)
    event = Event.find_by(id: event_id)
    customers = User.where(id: customer_ids)
    if event && customers.present?
      customers.each do |customer|
        puts "====An event has been updated please find the following details===="
        puts "\n"
        puts "Event Title: #{event.title} \n"
        puts "Event Date: #{event.event_date} \n"
        puts "Event Time: #{event.event_time} \n"
        puts "Event Venue: #{event.venue} \n"
        puts "Booked By: #{customer.first_name customer.last_name}(#{customer.email})"
        puts "==========================================="
      end
    end
  end
end
