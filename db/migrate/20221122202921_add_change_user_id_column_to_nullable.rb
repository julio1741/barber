class AddChangeUserIdColumnToNullable < ActiveRecord::Migration[7.0]
  def up
    change_column :reservations, :user_id, :integer, null: true, default: nil
  end

  def down
    change_column :reservations, :user_id, :integer
  end
end
