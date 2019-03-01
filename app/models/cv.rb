class Cv < ApplicationRecord
  belongs_to :user
  has_many :cvs, :class_name => "Application", :foreign_key => "cv_id"
  has_many :video_cvs, :class_name => "Application", :foreign_key => "videocv_id"
  validates :file, presence: true
  mount_uploader :file, VideoUploader
end
