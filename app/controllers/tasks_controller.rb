class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(params[:task])
    if @task.save
      redirect_to task_url(@task)
    else
      render :action => :new
    end
  end

  def show
    @tasks = Task.all
    @task = Task.find_by_id!(params[:id])
  end

  def edit
    @task = Task.find_by_id!(params[:id])
    render :action => :new
  end

  def update
    @task = Task.find_by_id!(params[:id])
    @task.attributes = params[:task]
    if @task.save
      redirect_to task_path(@task)
    else
      render :action => :new
    end
  end

  def destroy
    @task = Task.find_by_id!(params[:id])
    @task.destroy
    redirect_to tasks_path
  end

  def submit_code
    @task = Task.find_by_id!(params[:id])
    if can_manage_tasks and params[:create_reference]
      code = @task.create_reference_code!(params[:code])
      redirect_to code_path(code)
    elsif params[:create_submission]
      submission = @task.create_submission(params[:code], current_user)
    end
  end

end
