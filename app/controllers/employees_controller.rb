class EmployeesController < ApplicationController
  http_basic_authenticate_with name: "silu", password: "silu"
  #before_filter :authenticate, :only => [:show]
  #after_filter :display_message
  #around_filter :display_everytime, :except => [:delete]

  def index
  #this is index method
  	@employees = Employee.all
  end

  def new
  	@employee = Employee.new
  end

  def create
  	@employee = Employee.new (params[:employee])
  	if @employee.save
  		redirect_to @employee, :notice => "Successfully created"
  	else
      flash[:notice] = "Fill form"
  		render :action => 'new'
  	end
  end

  def edit
  	@employee = Employee.find(params[:id])
  end

  def show
  	@employee = Employee.find(params[:id])
  end

  def update
  	@employee = Employee.find(params[:id])
  	if @employee.update_attributes(params[:employee])
  		redirect_to @employee, :notice => "Successfully updated"
  	else
      flash[:notice] = "Fill form"
  		render :action => 'edit'
  	end
  end

  def destroy
  	@employee = Employee.find(params[:id])
  	@employee.destroy
  	redirect_to :action => 'index'
  end

  private

  def authenticate
    if params[:user] == "silu"
    else
    flash[:notice] = "Authenticate User required!!"
    redirect_to root_path
  end
  end

  def display_message
    flash[:notice] = "You are previous visit was #{params[:action].to_s.upcase} page!!"
  end

  def display_everytime
    yield
    flash[:notice] = "You are currently logged in as silu"
    return true
  end

end
