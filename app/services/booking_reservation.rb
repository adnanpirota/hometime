class BookingReservation < Reservation
  attr_reader :payload

  def initialize(payload)
    @payload = payload[:reservation]
  end

  def code
    payload[:code]
  end

  def start_date
    payload[:start_date]
  end

  def end_date
    payload[:end_date]
  end

  def guest_params
    { first_name: payload[:guest_first_name], last_name: payload[:guest_last_name], email: payload[:guest_email], phone: payload[:guest_phone_numbers] }
  end

  def guest
    Guest.create_with(guest_params).find_or_create_by(email: guest_params[:email])
  end

  def payout_price
    payload[:expected_payout_amount]
  end

  def security_price
    payload[:listing_security_price_accurate]
  end

  def total_price
    payload[:total_price] ||= payout_price + security_price
  end

  def currency
    payload[:currency]
  end

  def paid_amount
    payload[:total_paid_amount_accurate] ||= 0
  end

  def nights
    payload[:nights]
  end

  def number_of_guests
    payload[:number_of_guests]
  end

  def number_of_adults
    payload[:guest_details][:number_of_adults]
  end

  def number_of_children
    payload[:guest_details][:number_of_children]
  end

  def number_of_infants
    payload[:guest_details][:number_of_infants]
  end

  def status
    payload[:status_type]
  end
end
