class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :question, counter_cache: true
end
