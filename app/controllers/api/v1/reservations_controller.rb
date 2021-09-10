module Api
  module V1
    class ReservationsController < ActionController::API

      def create
        raw_http_body_request = request.raw_post
        attrs = ReservationBuilder.new(raw_http_body_request).build

        reservation = Reservation.find_by_code(attrs[:code])

        if reservation
          reservation.update(attrs)
          # here we can send mail to notice of change in reservation
        else
          Reservation.create(attrs)
        end

        render json: :success, status: 200
      end
    end
  end
end