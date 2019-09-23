class EmployeesController < ApplicationController
  def index
    employees = Employee.all
    render json: employees
  end

  def show
    employee = Employee.find_by(username: user_atm[:username])
    if employee
      render json: employee, include: "**", employee_id: employee.id
    else
      render json: {error: "User not found"}
    end
  end
end
