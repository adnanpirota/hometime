class Reservation < ApplicationRecord
  belongs_to :guest

  validates_uniqueness_of :code
  
  enum status: %i[accepted pending rejected]
end
