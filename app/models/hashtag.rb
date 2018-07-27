class Hashtag < ApplicationRecord
  has_many :questions, through: :q_tagships, dependent: :restrict_with_error
  has_many :q_tagships
end
