class Application < ApplicationRecord
  belongs_to :user
  belongs_to :position
  belongs_to :cv, :class_name => "Cv"
  belongs_to :videocv, :class_name => "Cv"
  attribute :status, :string, default: "Applied"
end
