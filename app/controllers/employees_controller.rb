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

  def create
    employee = Employee.create(employee_params)

    render json: { full_name: employee.full_name }, status: :created
  end

  private

  def employee_params
    params.permit(:first_name, :last_name)
  end
end
