class Task < ActiveRecord::Base
  attr_accessible :description, :index, :title, :public, :show_example_results
  validates_presence_of :description, :index, :title
  has_many :testcases
  has_many :public_testcases, :conditions => { :public => true }
  has_many :reference_codes, :as => :runnable, :class_name => "Code", :order => 'id ASC'
  has_many :codes
  has_many :submissions

  def self.tasklist(all=false)
    tasks = order('`index` ASC')
    tasks = tasks.where(:public => true) unless all
    tasks
  end

  def reference_code
    reference_codes.last
  end

  def can_submit
    reference_code && reference_code.is_graded && reference_code.is_success
  end

  def public_results
    return [] unless can_submit
    reference_code.results.select do |result|
      result.testcase.public
    end
  end

  def create_reference_code!(source_code)
    Code.submit_code!(source_code, self, testcases)
  end

  def create_submission!(source_code, user)
    submission = Submission.new
    submission.task = self
    submission.user = user
    submission.save!
    code = Code.submit_code!(source_code, submission, testcases)
    submission
  end

end
