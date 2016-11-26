class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :listing, index: true, foreign_key: true
      t.date :check_in
      t.date :check_out
      t.integer :total_price

      t.timestamps null: false
    end
  end
end
