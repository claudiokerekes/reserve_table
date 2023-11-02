module Api
  module V1
    class ReportController < ApplicationController
      def index
        bookings = Booking.where("DATE(date_time) = ?", parse_date ) if params[:date_time].present?
        render json: { bookings: bookings.as_json }
      end

      def parse_date
        Date.parse( params[:date_time])
      end
    end
  end
end