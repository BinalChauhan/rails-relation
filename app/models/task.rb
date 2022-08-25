class Task < ApplicationRecord
  belongs_to :project
  has_many :subtasks, dependent: :destroy
  has_many :comments, as: :commented_on
end
