require "rails_helper"

RSpec.describe BookingReservation, type: :model do
  subject {
    BookingReservation.new({
                             "reservation": {
                               "code": "XXX12345678",
                               "start_date": "2021-03-12",
                               "end_date": "2021-03-16",
                               "expected_payout_amount": "3800.00",
                               "guest_details": {
                                 "localized_description": "4 guests",
                                 "number_of_adults": 2,
                                 "number_of_children": 2,
                                 "number_of_infants": 0
                               },
                               "guest_email": "wayne_woodbridge@bnb.com",
                               "guest_first_name": "Wayne",
                               "guest_last_name": "Woodbridge",
                               "guest_phone_numbers": [
                                 "639123456789",
                                 "639123456789"
                               ],
                               "listing_security_price_accurate": "500.00",
                               "host_currency": "AUD",
                               "nights": 4,
                               "number_of_guests": 4,
                               "status_type": "accepted",
                               "total_paid_amount_accurate": "4300.00"
                             } })
  }

  it "knows to build guest" do
    guest = subject.guest

    expect(guest.id).to be_a(Integer)
  end

  it "knows how to parse guest params" do
    guest_params = subject.guest_params
    expect(guest_params).to eq({"first_name": "Wayne",
                                "last_name": "Woodbridge",
                                "phone": [
                                  "639123456789",
                                  "639123456789"
                                ],
                                "email": "wayne_woodbridge@bnb.com"})
  end
end