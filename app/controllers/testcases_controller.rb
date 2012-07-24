class TestcasesController < ApplicationController
  before_filter :task_manage

  def index
    @task = Task.find(params[:task_id])
    @testcases = @task.testcases
    @testcase = @task.testcases.build
  end

  def edit
    @testcase = Testcase.find(params[:id])
    @task = @testcase.task
  end

  def create
    @task = Task.find(params[:task_id])
    @testcase = @task.testcases.build(params[:testcase])
    if @testcase.save
      redirect_to task_testcases_path(@task)
    else
      render :action => :edit
    end
  end

  def update
    @testcase = Testcase.find(params[:id])
    @task = @testcase.task
    @testcase.attributes = params[:testcase]
    if @testcase.save
      redirect_to task_testcases_path(@task)
    else
      render :action => :edit
    end
  end

  def destroy
    if Testcase.find(params[:id]).delete
      redirect_to task_testcases_path(params[:task_id])
    else
      raise "Cannot delete somehow"
    end
  end
  
end
