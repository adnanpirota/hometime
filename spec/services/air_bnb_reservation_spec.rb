require "rails_helper"

RSpec.describe AirBnbReservation, type: :model do
  subject {
    AirBnbReservation.new({
                            "reservation_code": "YYY12345678",
                            "start_date": "2021-04-14",
                            "end_date": "2021-04-18",
                            "nights": 4,
                            "guests": 4,
                            "adults": 2,
                            "children": 2,
                            "infants": 0,
                            "status": "accepted",
                            "guest": {
                              "first_name": "Wayne",
                              "last_name": "Woodbridge",
                              "phone": "639123456789",
                              "email": "wayne_woodbridge@bnb.com"
                            },
                            "currency": "AUD",
                            "payout_price": "4200.00",
                            "security_price": "500",
                            "total_price": "4700.00"
                          })
  }

  it "knows to build guest" do
    guest = subject.guest

    expect(guest.id).to be_a(Integer)
  end

  it "knows how to parse guest params" do
    guest_params = subject.guest_params
    expect(guest_params).to eq({"first_name": "Wayne",
                              "last_name": "Woodbridge",
                              "phone": ["639123456789"],
                              "email": "wayne_woodbridge@bnb.com"})
  end
end