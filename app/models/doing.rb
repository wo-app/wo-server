class Doing < ActiveRecord::Base
  belongs_to :user

  scope :recent, -> { group(:user_id).order(updated_at: :desc) }

  after_save do
    user.update(
      recent_repo:   repo,
      recent_branch: branch,
      recent_did_at: created_at
    )
  end
end
