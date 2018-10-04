class EmployeesController < ApplicationController
  def index
    employees = Employee.all
    result = {
        employees: employees.map { |employee| { full_name: employee.full_name } }
    }
    render json: result, status: 200
  end
end
