class AddListingIdToListing < ActiveRecord::Migration
  def change
    add_column :listings, :list_id, :integer
  end
end
