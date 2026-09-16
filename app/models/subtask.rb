class Subtask < ApplicationRecord
  belongs_to :task

  validates :name, presence :true
  validates :description, presence :true

  def self.create_subtask(task_id, subtask_details)
    task = Task.find(task_id)
    task.subtasks.create(subtask_details)
  end

  def self.view_subtasks(task_id)
    task = Task.find(task_id)
    task.subtasks
  end
end
