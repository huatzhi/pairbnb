class AddSomeColumnsToListings < ActiveRecord::Migration
  def change
    change_table :listings do |t|
      t.string :note
      t.string :country
      t.string :city
      t.remove :check_in
      t.remove :check_out
    end
  end
end
