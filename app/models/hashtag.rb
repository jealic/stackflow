class Hashtag < ApplicationRecord
  #table name: hashtags
  #
  # name     :string, null:false

  validates_presence_of :name
  validates :name, length: { maximum: 10, message: "hashtag can be allowed at most 10 words", }
  

  has_many :q_tagships
  has_many :questions, through: :q_tagships, dependent: :restrict_with_error
  
end 
