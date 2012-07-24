class Result < ActiveRecord::Base
  belongs_to :code
  belongs_to :testcase
end
