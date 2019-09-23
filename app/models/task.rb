class Task < ApplicationRecord
  has_many :employee_tasks, :dependent => :destroy
  has_many :employees, through: :employee_tasks
  belongs_to :project

  validates :name, presence: true
  validates :total_working_time, presence: true

  accepts_nested_attributes_for :employee_tasks
end
