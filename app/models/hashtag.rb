# == Schema Information
#
# Table name: hashtags
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Hashtag < ApplicationRecord
  #table name: hashtags
  #
  # name     :string, null:false

  validates_uniqueness_of :name
  validates :name, length: { maximum: 10, message: "hashtag can be allowed at most 10 words" }
  validates :name, format: { with: /\p{Han}|\A[a-zA-Z]+\z|[+]|[-]/,message: "only allows letters or few special chars" }
  validates :name, format: { without: /[ ]|[*]|[_]|[?]/,message: "special char is not allowed" }


  has_many :q_tagships
  has_many :questions, through: :q_tagships, dependent: :restrict_with_error 
end 
