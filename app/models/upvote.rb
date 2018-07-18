class Upvote < ApplicationRecord
  belongs_to :answer, counter_cache: true
  belongs_to :user
  belongs_to :question, counter_cache: true
end
