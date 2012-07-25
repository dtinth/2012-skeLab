class CodesController < ApplicationController
  def show
    @code = Code.from_param(params[:id], :bypass_secret => can_manage_tasks)
  end
  def ungraded
   codes = Code.find(:all, :conditions => { :is_graded => [false, nil] })
   output = codes.map do |code|
     {
       :source_code => code.source_code,
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
end
