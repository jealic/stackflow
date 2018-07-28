class Hashtag < ApplicationRecord
  #table name: hashtags
  #
  # name     :string, null:false

  validates_presence_of :name
  validates :name, length: { maximum: 10, message: "hashtag can be allowed at most 10 words" }
  validates :name, format: { with: /\p{Han}|\A[a-zA-Z]+\z|[+]|[-]/,message: "only allows letters or few special chars" }
  validates :name, format: { without: /[ ]|[*]|[_]|[?]/,message: "special char is not allowed" }


  has_many :q_tagships
  has_many :questions, through: :q_tagships, dependent: :restrict_with_error
  
end 
