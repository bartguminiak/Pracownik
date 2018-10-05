class EmployeesController < ApplicationController
  def index
    employees = Employee.all
    result = {
        employees: employees.map { |employee| { full_name: employee.full_name } }
    }
    render json: result, status: 200
  end

  def show
    id = params[:id]
    employee = Employee.find(id)
    result = { full_name: employee.full_name }

    render json: result, status: :ok

  rescue ActiveRecord::RecordNotFound
      render json: {}, status: :not_found
    end
end
