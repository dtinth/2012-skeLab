class Submission < ActiveRecord::Base
  belongs_to :task
  belongs_to :user
  has_one :code, :as => :runnable

  def grade
    @gradestring = ''
    score = 0
    testcount = 0
    ref = task.reference_code
    code.results.each do |result|
      next unless result.is_graded
      err = result.error_messages
      testcount += 1
      if err =~ /COMPUTATION TIMED OUT/
        @gradestring += 'T'
      elsif result.is_success
        a = result.reference_result.output.to_s.chomp
        b = result.output.to_s.chomp
        if a == b
          @gradestring += 'P'
          score += 1
        else
          a = a.gsub(/\s+/, '')
          b = b.gsub(/\s+/, '')
          if a == b
            @gradestring += 'S'
          else
            @gradestring += '-'
          end
        end
      else
        @gradestring += 'X'
      end
    end
    @score = score * 100 / testcount
  end

  attr_reader :gradestring
  attr_reader :score
end
