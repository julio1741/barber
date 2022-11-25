class CreateOrganizations < ActiveRecord::Migration[7.0]
  def change
    create_table :organizations do |t|
      t.string :name
      t.string :uri_web
      t.string :nid
      t.string :logo

      t.timestamps
    end
  end
end
