class User < ActiveRecord::Base
  has_many :doings
end
