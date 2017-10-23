class AddLinkToSlider < ActiveRecord::Migration
  def change
    add_column :sliders, :link_eng, :text
  end
end
