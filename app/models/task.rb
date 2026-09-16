class Task < ApplicationRecord
  has_many :subtasks, dependent: :destroy

  validates :name, :description, :due_date, :category, :priority, presence: true
  validates :priority, inclusion: { in: %w[L M H] }

  def self.create_task(task_details)
    create(task_details)
  end

  def self.view_tasks
    all
  end

  def self.find_task(id)
    find(id)
  end

  def self.search_task(keyword)
    where("name LIKE ?", "%#{keyword}%")
  end

  def self.update_task(id, task_details)
    task = find(id)
    task.update(task_details)
    task
  end

  def self.delete_task(id)
    find(id).destroy
  end
end