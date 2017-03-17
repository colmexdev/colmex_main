class AddSemblanzaToEmeritos < ActiveRecord::Migration
  def change
    add_column :emeritos, :semblanza_eng, :text
  end
end
