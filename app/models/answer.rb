class Answer < ApplicationRecord
  belongs_to :user, counter_cache: true
  belongs_to :question, counter_cache: true
  has_many :upvotes
end
