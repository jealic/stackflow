# == Schema Information
#
# Table name: q_tagships
#
#  id          :integer          not null, primary key
#  question_id :integer
#  hashtag_id  :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class QTagship < ApplicationRecord

  #== schema Information

  # Table Name: q_tagships
  #
  # question_id     :integer
  # hashtag_id      :integer
  validates_uniqueness_of :hashtag_id, :scope => :question_id


  belongs_to :hashtag
  belongs_to :question
  validates_associated :question
end
