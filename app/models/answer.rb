# == Schema Information
#
# Table name: answers
#
#  id            :integer          not null, primary key
#  content       :text
#  user_id       :integer
#  question_id   :integer
#  upvotes_count :integer          default(0)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Answer < ApplicationRecord
  belongs_to :question, counter_cache: true #一個問題有多少個回答
  belongs_ to :user, counter_cache: true
  has_many :upvotes, dependent: :destroy
  #突然覺得沒有counter_cache 也會知道一個 user 問過多少問題吧？
end
