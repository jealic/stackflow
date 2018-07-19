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
end
