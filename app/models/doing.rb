class Doing < ActiveRecord::Base
  belongs_to :user

  scope :recent, -> { group(:user_id).order(updated_at: :desc) }
end
