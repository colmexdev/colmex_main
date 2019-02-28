class AddIndexToBeneficiaries < ActiveRecord::Migration
  def change
    add_column :beneficiaries, :index, :integer
  end
end
