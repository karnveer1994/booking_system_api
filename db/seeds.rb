event_organizer = User.create(first_name: 'John', last_name: 'Doe', role: 'Event Organizer', password: 'password', provider: 'email', email: 'organizer@gmail.com')

customer = User.create(first_name: 'John', last_name: 'Doe', role: 'Customer', password: 'password', provider: 'email', email: 'customer@gmail.com')


event = event_organizer.events.create(title: "Test Event 1", event_date: "29/12/2023", event_time: '06:00 AM', venue: 'Sayaji Hotel Indore')

ticket_1 = event.tickets.create(price: 100, ticket_type: 'General Admission', availability: true)

ticket_2 = event.tickets.create(price: 150, ticket_type: 'VIP', availability: true)

customer.bookings.create(ticket_id: ticket_1.id)

customer.bookings.create(ticket_id: ticket_2.id)