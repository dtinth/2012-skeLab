class Task < ActiveRecord::Base
  attr_accessible :description, :index, :title
  validates_presence_of :description, :index, :title
  has_many :testcases
  has_many :reference_codes, :as => :runnable, :class_name => "Code"
  has_many :codes

  def create_reference_code!(source_code)
    Code.submit_code!(source_code, self, testcases)
  end

  def create_submission!(source_code, user)
    submission = Submission.new
    submission.task = self
    submission.user = user
    submission.save!
    code = Code.submit_code!(source_code, submission, testcases)
  end

end
