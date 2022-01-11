class Employee < ApplicationRecord
	before_save { self.email = email.downcase }
	regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :name, presence: true
	validates :email, presence: true, length: { maximum: 255 }, format: { with: regex }, uniqueness: true
	validates :joining_date, presence: true
	validates :birth_date, presence: true
end
