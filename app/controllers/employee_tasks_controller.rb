class EmployeeTasksController < ApplicationController
  def update
    # debugger
    currentTask = Task.find_by(id: params[:id])
    currentEmployee = Employee.find_by(username: user_atm[:username])
    et = currentTask.employee_tasks.find_by(employee_id: currentEmployee.id)
    et.update(hours_done: params[:hours_done])
    currentTask.total_working_done = currentTask.reload.employee_tasks.map{|employeetask| employeetask.hours_done}.sum.to_f
    # debugger
    currentTask.save
    render json: currentEmployee, include: "**", employee_id: currentEmployee.id
  end
end
