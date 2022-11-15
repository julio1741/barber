class AddDescriptionToWorkers < ActiveRecord::Migration[7.0]
  def change
    add_column :workers, :description, :string
  end
end
