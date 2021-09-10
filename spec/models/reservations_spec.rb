require "rails_helper"

RSpec.describe Reservation, type: :model do
  let(:guest) { FactoryBot.create(:guest) }
  subject {
    FactoryBot.create(:reservation, guest: guest)
  }

  it "is not valid without guest" do
    subject.guest = nil

    expect(subject).to be_invalid
  end

  it "is not valid if code is not unique" do
    reservation2 = Reservation.new(code: subject.code, guest: guest)
    expect(reservation2).to be_invalid
  end

  it "is not valid without guest" do
    subject.guest = nil
    expect(subject).to be_invalid
  end

end