class Employer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :positions
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :company_name, presence: true
  validates :employer_bio, length: { in: 100..1000, wrong_length: "Please keep it within 100-1000 characters." }, allow_blank: true
  validates :employer_website, allow_blank: true, format: { with: /https?:\/\/(?:www\.|(?!www))[a-zA-Z0-9][a-zA-Z0-9-]+[a-zA-Z0-9]\.[^\s]{2,}|www\.[a-zA-Z0-9][a-zA-Z0-9-]+[a-zA-Z0-9]\.[^\s]{2,}|https?:\/\/(?:www\.|(?!www))[a-zA-Z0-9]\.[^\s]{2,}|www\.[a-zA-Z0-9]\.[^\s]{2,}/ }
end
