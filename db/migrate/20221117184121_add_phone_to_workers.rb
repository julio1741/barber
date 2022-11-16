class AddPhoneToWorkers < ActiveRecord::Migration[7.0]
  def change
    add_column :workers, :phone, :string
  end
end
