class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :filtered_tasks, :project_total_worktime, :project_total_done
  has_many :tasks

  def filtered_tasks
    # debugger
    if @instance_options[:employee_id]
      current_employee = Employee.find_by(id: @instance_options[:employee_id])
      self.object.tasks.select{|task| task.employees.include?(current_employee)}
    else
      return nil
    end
  end



end
