class AddAttributesToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :contact_info, :string
    add_column :users, :image, :string
    add_column :users, :cv_array, :string, array: true, default: []
    add_column :users, :video_array, :string, array: true, default: []
  end
end
