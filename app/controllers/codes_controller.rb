class CodesController < ApplicationController
  def show
    @code = Code.find(params[:id])
  end
end
