class ReservationBuilder
  class UnknownSender < StandardError; end

  def initialize(request)
    @request = request
  end

  def build
    {
      code: code,
      start_date: start_date,
      end_date: end_date,
      guest: guest,
      payout_price: payout_price,
      security_price: security_price,
      total_price: total_price,
      currency: currency,
      paid_amount: paid_amount,
      nights: nights,
      number_of_guests: number_of_guests,
      number_of_adults: number_of_adults,
      number_of_children: number_of_children,
      number_of_infants: number_of_infants,
      status: status
    }
  end

  def method_missing(method, *args, &block)
    sender_reservation.send(method)
  end

  private

  attr_reader :request

  def parsed_request
    @parsed_request ||= JSON.parse(request, symbolize_names: true)
  end

  def sender_reservation
    return @sender_reservation if @sender_reservation

    sender_klass =
      if parsed_request[:reservation_code]
        AirBnbReservation
      elsif parsed_request[:reservation]
        BookingReservation
      else
        raise UnknownSender("Unknown sender for payload: #{payload}")
      end

    @sender_reservation = sender_klass.new(parsed_request)
  end
end
