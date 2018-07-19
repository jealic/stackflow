# == Schema Information
#
# Table name: upvotes
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  question_id :integer
#  answer_id   :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Upvote < ApplicationRecord
end
