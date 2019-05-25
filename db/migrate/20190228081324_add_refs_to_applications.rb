class AddRefsToApplications < ActiveRecord::Migration[5.1]
  def change
    add_column :applications, :cv_id, :integer
    add_column :applications, :videocv_id, :integer
  end
end
