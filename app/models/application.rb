class Application < ApplicationRecord
  belongs_to :user
  belongs_to :position
  attribute :status, :string, default: "Applied"
end
