class AddAddressToBranches < ActiveRecord::Migration[7.0]
  def change
    add_column :branches, :address, :string
  end
end
