class Code < ActiveRecord::Base
  belongs_to :runnable, :polymorphic => true
  belongs_to :task
  attr_accessible :is_graded, :source_code
end
