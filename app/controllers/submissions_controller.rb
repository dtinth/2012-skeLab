class SubmissionsController < ApplicationController
  before_filter :get_submission
  def show
    if !@submission.code.is_graded
      render 'ungraded'
    else
      @submission.grade
    end
  end
  def check
    render :json => { :graded => !!@submission.code.is_graded,
      :check_in => 3 }
  end
  def get_submission
    @submission = Submission.find(params[:id])
    unless @submission.user == current_user or can_manage_tasks
      raise "forbidden"
    end
  end
end
