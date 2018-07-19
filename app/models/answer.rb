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
end
