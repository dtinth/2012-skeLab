class Result < ActiveRecord::Base
  belongs_to :code
  belongs_to :testcase

  def reference_result
    testcase.task.reference_code.results.find_by_testcase_id(testcase.id)
  end
end
