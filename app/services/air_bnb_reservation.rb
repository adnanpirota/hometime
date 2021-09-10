class AirBnbReservation < Reservation
  attr_reader :payload

  def initialize(payload)
    @payload = payload
  end

  def code
    payload[:reservation_code]
  end

  def start_date
    payload[:start_date]
  end

  def end_date
    payload[:end_date]
  end

  def guest_params
    phone_arr = [payload[:guest][:phone]]
    payload[:guest][:phone] = phone_arr
    payload[:guest]
  end

  def guest
    Guest.create_with(guest_params).find_or_create_by(email: guest_params[:email])
  end

  def payout_price
    payload[:payout_price]
  end

  def security_price
    payload[:security_price]
  end

  def total_price
    payload[:total_price]
  end

  def currency
    payload[:currency]
  end

  def paid_amount
    payload[:paid_amount] ||= 0
  end

  def nights
    payload[:nights]
  end

  def number_of_guests
    payload[:number_of_guests]
  end

  def number_of_adults
    payload[:number_of_adults]
  end

  def number_of_children
    payload[:number_of_children]
  end

  def number_of_infants
    payload[:number_of_infants]
  end

  def status
    payload[:status]
  end
end
