
require 'attendance_map'

class Attendance < ActiveRecord::Base
  belongs_to :user
  belongs_to :period
  attr_accessible :user, :period
  def self.attendance_map
    map = AttendanceMap.new
    find_each do |attendance|
      map.add(attendance.user_id, attendance.period_id)
    end
    map
  end
end

