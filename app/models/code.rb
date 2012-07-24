class Code < ActiveRecord::Base
  belongs_to :runnable, :polymorphic => true
  attr_accessible :is_graded, :source_code
  has_many :results

  def self.submit_code!(source_code, runnable, testcases)
    code = new(:source_code => source_code)
    testcases.each do |testcase|
      result = code.results.build
      result.testcase = testcase
      result.input = testcase.input_data
      result.is_graded = false
    end
    code.runnable = runnable
    code.save!
    code
  end
end
