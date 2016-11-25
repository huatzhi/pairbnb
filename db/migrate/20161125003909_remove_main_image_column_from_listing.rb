class RemoveMainImageColumnFromListing < ActiveRecord::Migration
  def up
    remove_column :listings, :main_image
  end

  def down
    add_column :listings, :main_image, :string
  end
end
