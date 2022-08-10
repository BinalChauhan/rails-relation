class Company < ApplicationRecord
  has_many :employees
  has_many :posts
end
