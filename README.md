# README

# README

In this file, we will describe the step-by-step process to deploy this Rails application:

1. You must have Docker installed and the Docker Compose wrapper.
2. Download the code to your computer.
3. Run the following command in the root of the downloaded repository: `docker-compose up -d`.
4. Access it through the browser: `http://localhost:3003`.
5. If you want to run this application without Docker, replace "db" with "localhost" in the `database.yml` configuration file: `host: localhost`.
   5.1. You should run the necessary migrations and seed data.
6. To consume the API:
   ```
   curl --location 'http://localhost:3000/api/v1/report/?date_time=2023-11-03'
   ```
   
In this app, you can:
* sign in
* sign up
* sign out
* create booking
* create booking from table (link)
* see all tables (and you can create it i you wish)
* see your table bookings/reservations

Enjoy!!