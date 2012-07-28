class AttendancesController < ApplicationController
  def index
    require_admin
    @users = User.all
    @periods = Period.all
    @attendance_map = Attendance.attendance_map
  end
  
  def create
    if params[:mark]
      mark_attendance
    elsif params[:stop]
      stop_current_attendance_checking
    else
      raise "Unknown action"
    end
  end

  def mark_attendance
    raise "already attending" if is_current_user_attending
    raise "no current user" unless current_user
    @attendance = Attendance.new
    @attendance.user = current_user
    @attendance.period = Period.active
    @attendance.save!
    redirect_to request.referer || root_path
  end

  def stop_current_attendance_checking
    raise "not admin" unless is_admin
    current = Period.active
    current.is_active = false
    current.save!
    redirect_to attendances_path
  end
    
end
