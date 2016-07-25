class AddTagsToDescubre < ActiveRecord::Migration
  def change
    add_column :descubres, :tags, :text, default: [].to_yaml
  end
end
