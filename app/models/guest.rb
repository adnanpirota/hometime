class Guest < ApplicationRecord
  has_many :reservations

  validates_presence_of :email
  validates_uniqueness_of :email

end
