class ChangeOrganizationIdToInteger < ActiveRecord::Migration[7.0]
  def change
    change_column :branches, :organization_id, 'integer USING CAST(organization_id AS integer)'
  end
end
