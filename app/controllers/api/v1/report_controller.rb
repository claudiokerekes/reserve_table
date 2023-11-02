module Api
  module V1
    class ReportController < ApplicationController
      def index
       @bookings = Booking.where("DATE(date_time) = ?", parse_date ) if params[:date_time].present?
       render "api/v1/report/index"
      end

      def parse_date
        Date.parse( params[:date_time])
      end
    end
  end
end