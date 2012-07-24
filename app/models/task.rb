class Task < ActiveRecord::Base
  attr_accessible :description, :index, :title
  validates_presence_of :description, :index, :title
  has_many :testcases
  has_many :reference_codes, :as => :runnable, :class_name => "Code"
  has_many :codes
end
