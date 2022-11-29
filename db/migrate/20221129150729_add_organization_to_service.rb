class AddOrganizationToService < ActiveRecord::Migration[7.0]
  def change
    add_reference :services, :organization, null: false, foreign_key: true
  end
end
