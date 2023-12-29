Please take clone using below command

`git clone https://github.com/karnveer1994/booking_system_api.git`

update `config/database.yml` with username and password of postgresql db.

ruby version is set to "2.7.6" please install it before running bundle install.

Run Command
`bundle install`

Run Command
`rails db:create`

Run Command
`rails db:migrate`

=======================================================
Run Command
`rails db:seed`

It will create an Event Organizer and a Customer

Organizer
email: `organizer@gmail.com`
password: `password`

Customer
email: 'customer@gmail.com'
password: `password`

==========================================================

Login As Oganizer
==========================================================
Sign IN
method: POST
URL http://localhost:3000/auth/sign_in.json

body: {
  "email": "organizer@gmail.com",
  "password": "password"
}

response: {
  {
    "data": {
      "email": "organizer@gmail.com",
      "uid": "organizer@gmail.com",
      "id": 1,
      "provider": "email",
      "first_name": "John",
      "last_name": "Doe",
      "role": "Event Organizer"
    }
  }
}

In Response Headers you will receive

access-token 64E_le061nUxDzMdf4dS-Q
client       WcbqqnA1RupKfvehNegbKQ
expiry       1705026771
uid          organizer@gmail.com


Copy these to request headers to valide token and continue with the action

You are logged in as Organizer so you will be able to Create, Read, Update and Delete Events.

==========================================================
Create Event

method POST
URL http://localhost:3000/events.json
Request Body

{
  "title": "Test Event 2",
  "event_date": "30/12/2023",
  "event_time": "08:00 AM",
  "venue": "Sayaji Hotel, Bhopal" 
}

Response 

{
  "id": 2,
  "title": "Test Event 2",
  "event_date": "2023-12-23",
  "event_time": "2000-01-01T08:00:00.000Z",
  "venue": "Sayaji Hotel, Bhopal",
  "user_id": 1,
  "created_at": "2023-12-29T02:37:31.198Z",
  "updated_at": "2023-12-29T02:37:31.198Z"
}
==========================================================
method GET
Get Specific event

URL http://localhost:3000/events/1.json

Response Body

{
  "id": 1,
  "title": "Test Event",
  "event_date": "2023-12-29",
  "event_time": "2000-01-01T06:00:00.000Z",
  "venue": "Sayaji Hotel, INDORE",
  "user_id": 1,
  "created_at": "2023-12-29T02:23:28.238Z",
  "updated_at": "2023-12-29T02:29:13.780Z"
}
==========================================================
method PUT
Update Specific event
URL http://localhost:3000/events/1.json

Request Body
{
  event_time: "10:00 AM"
}

Response Body
{
  "message": "Event Updated Successfully"
}
==========================================================
method GET
Get all Events
URL http://localhost:3000/events.json

Response Body
[
    {
        "id": 1,
        "title": "Test Event",
        "event_date": "2023-12-29",
        "event_time": "2000-01-01T06:00:00.000Z",
        "venue": "Sayaji Hotel, INDORE",
        "user_id": 1,
        "created_at": "2023-12-29T02:23:28.238Z",
        "updated_at": "2023-12-29T02:29:13.780Z"
    },
    {
      "id": 2,
      "title": "Test Event 2",
      "event_date": "2023-12-23",
      "event_time": "2000-01-01T08:00:00.000Z",
      "venue": "Sayaji Hotel, Bhopal",
      "user_id": 1,
      "created_at": "2023-12-29T02:37:31.198Z",
      "updated_at": "2023-12-29T02:37:31.198Z"
    }
]
==========================================================

==========================================================
Login As Customer
==========================================================
Get All Bookings
method GET
URL http://localhost:3000/bookings.json

Response Body

[
  {
    "id": 1,
    "ticket_id": 1,
    "user_id": 2,
    "created_at": "2023-12-29T04:13:41.510Z",
    "updated_at": "2023-12-29T04:13:41.510Z"
  },
  {
    "id": 2,
    "ticket_id": 2,
    "user_id": 2,
    "created_at": "2023-12-29T04:13:41.561Z",
    "updated_at": "2023-12-29T04:13:41.561Z"
  }
]
=======================================================
Create Booking
method POST
URL http://localhost:3000/bookings.json

Request Body

{
  "ticket_id": 2
}

Response Body

{
  "id": 3,
  "ticket_id": 2,
  "user_id": 2,
  "created_at": "2023-12-29T04:30:46.795Z",
  "updated_at": "2023-12-29T04:30:46.795Z"
}

=======================================================
method GET
Get Specific Booking
URL http://localhost:3000/bookings/1.json

Response Body

{
  "id": 1,
  "ticket_id": 1,
  "user_id": 2,
  "created_at": "2023-12-29T04:13:41.510Z",
  "updated_at": "2023-12-29T04:13:41.510Z"
}

=======================================================

