class ChangeColumnAdministradorToAdmins < ActiveRecord::Migration
  def change
    change_column :admins, :admin, :text, :default => nil
  end
end
