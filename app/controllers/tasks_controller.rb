class TasksController < ApplicationController

  def index
    @tasks = tasklist
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
    @tasks = tasklist
    @task = get_task
    @my_submissions = Submission.where(:user_id => current_user.id, :task_id => @task.id).order('created_at DESC')
    @starting_code = <<CODE
using System;
class Program
{
    public static void Main()
    {
        // write your program here
    }
}
CODE
    if params[:base]
      submission = Submission.find(params[:base])
      if submission.user == current_user or can_manage_tasks
        @starting_code = submission.code.source_code
      end
    end
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
    @task = get_task
    if can_manage_tasks and params[:create_reference]
      code = @task.create_reference_code!(params[:code])
      redirect_to code_path(code)
    elsif params[:create_submission]
      submission = @task.create_submission!(params[:code], current_user)
      redirect_to submission_path(submission)
    end
  end

  private
  def tasklist
    Task.tasklist(can_manage_tasks)
  end

  def get_task
    task = Task.find_by_id!(params[:id])
    raise "private task" unless task.public or can_work_on_private_tasks
    task
  end

end
