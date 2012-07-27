class Period < ActiveRecord::Base
  attr_accessible :date, :is_active
  after_initialize :default_values

  private
  def default_values
    self.date ||= Date.today
  end
end
