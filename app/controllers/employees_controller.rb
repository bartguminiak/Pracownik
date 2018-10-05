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

    if employee.persisted?
      result = { full_name: employee.full_name }
      status = :created
    else
      result = { erorrs: employee.errors.full_messages.map { |msg| { message: msg } } }
      status = 422
    end

    render json: result, status: status
  end

  private

  def employee_params
    params.permit(:first_name, :last_name)
  end
end
