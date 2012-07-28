
class AttendanceMap
  def initialize()
    @map = {}
  end
  def add(user_id, period_id)
    @map["#{user_id}:#{period_id}"] = true
  end
  def has(user_id, period_id)
    @map["#{user_id}:#{period_id}"]
  end
end
