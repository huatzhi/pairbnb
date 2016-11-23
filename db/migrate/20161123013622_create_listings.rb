class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :title
      t.integer :bedroom
      t.time :check_in
      t.time :check_out
      t.integer :number_of_guest
      t.string :description
      t.string :rules
      t.float :price_per_night
      t.string :availability_requirement
      t.string :main_image
      t.belongs_to :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
