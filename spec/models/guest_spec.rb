require "rails_helper"

RSpec.describe Guest, type: :model do

  subject {
    FactoryBot.create(:guest)
  }

  it "is not valid without email" do
    subject.email = nil
    expect(subject).to be_invalid
  end

  it "is not valid if email is not unique" do
    p subject.inspect
    guest = Guest.new(first_name: 'Adnan', last_name: 'Pirota', phone: ['23242'], email: subject.email)
    expect(guest).to be_invalid
  end

end