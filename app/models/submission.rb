class Submission < ActiveRecord::Base
  belongs_to :task
  belongs_to :user
  has_one :code, :as => :runnable
end
