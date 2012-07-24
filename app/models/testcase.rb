class Testcase < ActiveRecord::Base
  belongs_to :task
  attr_accessible :input_data, :public
end
