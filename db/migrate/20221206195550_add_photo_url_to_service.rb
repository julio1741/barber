class AddPhotoUrlToService < ActiveRecord::Migration[7.0]
  def change
    add_column :services, :photo_url, :string
  end
end
