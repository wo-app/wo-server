class UserSerializer < ActiveModel::Serializer
  include ActionView::Helpers::DateHelper
  attributes :name, :recent_repo, :recent_branch, :time_ago, :created_at, :updated_at

  def time_ago
    time_ago_in_words(object.recent_did_at, include_seconds: true)
  end
end
