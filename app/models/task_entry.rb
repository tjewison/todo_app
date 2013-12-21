class TaskEntry < ActiveRecord::Base
  validates :description, presence: true
end
