class DoingSerializer < ActiveModel::Serializer
  include ActionView::Helpers::DateHelper

  attributes :repo, :branch, :time_ago, :created_at, :updated_at

  has_one :user

  def time_ago
    time_ago_in_words(object.created_at, include_seconds: true)
  end
end
