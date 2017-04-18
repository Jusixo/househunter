class RemoveImgDataFromHomes < ActiveRecord::Migration[5.0]
  def change
    remove_column :homes, :img_data, :text
  end
end
