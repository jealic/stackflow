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
  has_many :upvotes
  has_many :upvotes
end
