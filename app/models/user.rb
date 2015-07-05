class User < ActiveRecord::Base
  has_many :doings
  belongs_to :organization
end
