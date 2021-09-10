class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.string :code, unique: true
      t.date :start_date
      t.date :end_date
      t.decimal :payout_price
      t.decimal :security_price
      t.decimal :total_price
      t.string :currency
      t.decimal :paid_amount
      t.integer :nights
      t.integer :number_of_guests
      t.integer :number_of_adults
      t.integer :number_of_children
      t.integer :number_of_infants
      t.references :guest, foreign_key: true
      t.integer :status


      t.timestamps
    end
  end
end