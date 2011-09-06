class User < ActiveRecord::Base
  acts_as_authentic

  has_many :roles_users
  has_many :roles, :through => :roles_users
end
