class AddImgNameToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :img_name, :string
  end
end
