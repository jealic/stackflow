# == Schema Information
#
# Table name: questions
#
#  id              :integer          not null, primary key
#  topic           :string
#  content         :text
#  user_id         :integer
#  answers_count   :integer          default(0)
#  upvotes_count   :integer          default(0)
#  favorites_count :integer          default(0)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Question < ApplicationRecord
  validates_presence_of :content

  belongs_to :user, counter_cache: true # user 問了多少個問題
  has_many :answers

  has_many :favorites, dependent: :destroy
  has_many :favorited_users, through: :favorites, source: :user
  #找到收藏問題的 user
  
<<<<<<< HEAD
  has_many :upvotes

  def is_favorited?(user)
    self.favorited_users.include?(user)
=======
  has_many :upvotes, dependent: :destroy
  has_many :upvoted_users, through: :upvotes, source: :user

  
  def is_upvoted?(user)
    self.upvoted_users.include?(user)
>>>>>>> 14d8421bfb56077e50767b7a21efd67895f16162
  end
end
