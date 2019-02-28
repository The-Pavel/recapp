class AddColumnToCvs < ActiveRecord::Migration[5.1]
  def change
    add_column :cvs, :file, :string
  end
end
