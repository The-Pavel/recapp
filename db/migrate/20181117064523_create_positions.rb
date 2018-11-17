class CreatePositions < ActiveRecord::Migration[5.1]
  def change
    create_table :positions do |t|
      t.string :title, null: false, default: ""
      t.string :location, null: false, default: ""
      t.integer :min_salary
      t.integer :max_salary
      t.string :active_status
      t.string :occupation_type
      t.text :responsibilities
      t.text :requirements
      t.references :employer, foreign_key: true

      t.timestamps
    end
  end
end
