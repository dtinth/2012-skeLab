class Attendance < ActiveRecord::Base
  belongs_to :user
  belongs_to :period
  attr_accessible :user, :period
end
