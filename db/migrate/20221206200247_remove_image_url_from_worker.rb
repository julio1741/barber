class RemoveImageUrlFromWorker < ActiveRecord::Migration[7.0]
  def change
    remove_column :workers, :image_url
  end
end
