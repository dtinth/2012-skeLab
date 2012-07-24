class User < ActiveRecord::Base
  attr_accessible :crypted_password, :login, :password, :password_confirmation
  acts_as_authentic do |c|
  end
end
