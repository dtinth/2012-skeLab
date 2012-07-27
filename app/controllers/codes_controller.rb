class CodesController < ApplicationController
  def show
    @code = Code.from_param(params[:id], :bypass_secret => can_manage_tasks)
  end
  def ungraded
   codes = Code.find(:all, :conditions => { :is_graded => [false, nil] })
   output = codes.map do |code|
     {
       :source_code => code.source_code,
       :id => code.id,
       :results => code.results.where({ :is_graded => [false, nil] }).map do |result|
        {
          :id => result.id,
          :input => result.input
        }
       end
     }
   end
   render :json => output
  end
  def grade
    params[:results].each do |result|
      model = Result.find(result[:id])
      model.is_graded = true
      model.is_success = result[:is_success]
      model.output = result[:output]
      model.output_json = result[:output_json]
      model.error_messages = result[:error_messages]
      model.save!
    end
    @code = Code.find(params[:id])
    @code.is_graded = true
    @code.error_messages = params[:error_messages]
    @code.is_success = params[:is_success]
    @code.save!
    render :json => "OK"
  end
end
