# == Schema Information
#
# Table name: favorites
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  question_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Favorite < ApplicationRecord
  validates :question_id, uniqueness: { scope: :user_id }

  belongs_to :question, counter_cache: true
  belongs_to :user
end
