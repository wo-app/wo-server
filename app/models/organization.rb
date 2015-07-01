class Organization < ActiveRecord::Base
  has_many :users
  has_many :doings, through: :users

  after_initialize do
    self.token = SecureRandom.uuid unless token
  end

  def to_param
    uuid
  end
end
