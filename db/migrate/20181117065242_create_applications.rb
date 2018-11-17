class CreateApplications < ActiveRecord::Migration[5.1]
  def change
    create_table :applications do |t|
      t.string :video
      t.string :cv
      t.string :status
      t.references :user, foreign_key: true
      t.references :position, foreign_key: true

      t.timestamps
    end
  end
end
