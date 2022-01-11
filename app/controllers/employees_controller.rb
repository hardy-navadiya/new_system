class EmployeesController < ApplicationController
  def index
    @employee = Employee.new
    @employees = Employee.all
  end

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.new(employee_params) 
    respond_to do |format|
      if @employee.save
        @employees = Employee.all
        format.html { redirect_to employees_url, notice: "Client was successfully created." }
        format.json { render :show, status: :created, location: @employee }
        format.js
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @employees.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  def show
    @employee = Employee.find(params[:id])
    @employee = Employee.new
  end

  def edit
    @employee = Employee.find(params[:id])
  end

  def update
    @employee = Employee.find(params[:id])
    respond_to do |format|
      if @employee.update(employee_params)
        @employees = Employee.all
        format.html { redirect_to employees_url, notice: "Client was successfully updated." }
        format.js
      else
        format.html { render :edit}
        format.js
      end
    end
  end

  def destroy
    @employee = Employee.find_by(params[:id])
    @employee.destroy
    respond_to do |format|
      format.html { redirect_to @employee, notice: "Client was successfully destroyed." }
      format.json { head :no_content }
      format.js
    end
  end

  private
  def employee_params
    params.require(:employee).permit(:name, :email, :joining_date, :birth_date)
  end
end
