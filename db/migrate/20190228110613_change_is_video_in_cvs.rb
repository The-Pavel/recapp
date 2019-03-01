class ChangeIsVideoInCvs < ActiveRecord::Migration[5.1]
  def change
    change_column :cvs, :is_video, :boolean, default: false
  end
end
