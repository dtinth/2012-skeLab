class Period < ActiveRecord::Base
  attr_accessible :date, :is_active
  after_initialize :default_values
  has_many :attendances
  has_many :users, :through => :attendances

  def self.active
    where(:is_active => true).first
  end

  private
  def default_values
    self.date ||= Date.today
  end

end
