class Project < ApplicationRecord
  belongs_to :manager
  has_many :tasks, :dependent => :destroy

  validates :name, presence: true
  def project_total_worktime
    self.tasks.map{|task| task.total_working_time}.sum.to_f
  end
  def project_total_done
    self.tasks.map{|task| task.total_working_done}.sum.to_f
  end
end
