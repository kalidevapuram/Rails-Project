class User < ActiveRecord::Base
  has_secure_password

  email_regex = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :first_name, :last_name, :email, presence:true
  validates :email, :uniqueness => true, :format => { :with => email_regex },
  :uniqueness => { :case_sensitive => false }
  validates :password, presence: true, :on => :create, length: { in: 3..20 }
end
