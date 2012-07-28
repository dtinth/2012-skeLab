class PeriodsController < ApplicationController
  def create
    raise "Already checking" if is_checking_attendance
    @period = Period.new
    @period.is_active = true
    @period.save!
    redirect_to attendances_path
  end
end
