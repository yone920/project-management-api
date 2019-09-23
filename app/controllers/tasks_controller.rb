class TasksController < ApplicationController
  def index
    tasks = Task.all
    render json: tasks
  end
  def show
    task = Task.find_by(id: params[:id])
    render json: task.to_json(include: [:project, :employees])
  end
  def create
    # debugger
    task = Task.create(task_params)
    params[:checked_employee].each do |employee|
      EmployeeTask.create(employee_id: employee, task: task)
    end
    render json: task.project.manager, include: "**"
  end
end

private

def task_params
  params.permit(:name, :total_working_time, :project_id)
end
