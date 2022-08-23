class Task < ApplicationRecord
  belongs_to :project
  has_many :subtasks, dependent: :destroy
end
