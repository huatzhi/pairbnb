class AddPreviewsToListings < ActiveRecord::Migration
  def change
    add_column :listings, :previews, :json
  end
end
