class AddFotoToBeneficiaries < ActiveRecord::Migration
  def change
    add_attachment :beneficiaries, :foto
  end
end
