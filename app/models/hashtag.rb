class Hashtag < ApplicationRecord
  #table name: hashtags
  #
  # name     :string, null:false

  validates_presence_of :name
  has_many :q_tagships
  has_many :questions, through: :q_tagships, dependent: :restrict_with_error
  
end
