class AddImageUrlToBranches < ActiveRecord::Migration[7.0]
  def change
    add_column :branches, :image_url, :string
  end
end
