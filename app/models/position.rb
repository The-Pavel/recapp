class Position < ApplicationRecord
  belongs_to :employer
  attribute :active_status, :string, default: "Active"
  validates :title, presence: true, length: { in: 1..100 }
  validates :responsibilities, presence: true
  validates :requirements, presence: true
end
