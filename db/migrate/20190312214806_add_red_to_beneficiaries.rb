class AddRedToBeneficiaries < ActiveRecord::Migration
  def change
    add_column :beneficiaries, :red, :text
  end
end
