class Project < ApplicationRecord
  has_and_belongs_to_many :developers
  has_many :tasks, dependent: :destroy
end
