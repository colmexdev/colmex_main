class AddPluralesToDescubre < ActiveRecord::Migration
  def change
    add_column :contents, :plural, :text
    add_column :contents, :plural_eng, :text
  end
end
