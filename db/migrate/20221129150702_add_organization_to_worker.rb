class AddOrganizationToWorker < ActiveRecord::Migration[7.0]
  def change
    add_reference :workers, :organization, null: false, foreign_key: true
  end
end
