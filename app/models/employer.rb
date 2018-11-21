class Employer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :positions
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :company_name, presence: true
end
