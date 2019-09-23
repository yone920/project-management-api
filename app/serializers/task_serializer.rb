class TaskSerializer < ActiveModel::Serializer
  attributes :id, :name, :total_working_time, :total_working_done, :filtered_employeetask
  # has_many :employee_tasks
  def filtered_employeetask
    if @instance_options[:employee_id]
      current_employee = Employee.find_by(id: @instance_options[:employee_id])
      self.object.employee_tasks.find_by(employee_id: current_employee.id)
    else
      return nil
    end
  end
end
