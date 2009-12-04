class Role < ActiveRecord::Base
  has_and_belongs_to_many :rights
  has_and_belongs_to_many :users
end
