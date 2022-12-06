class AddPhotoUrlToWorker < ActiveRecord::Migration[7.0]
  def change
    add_column :workers, :photo_url, :string
  end
end
