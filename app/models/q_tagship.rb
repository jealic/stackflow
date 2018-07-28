class QTagship < ApplicationRecord

  #== schema Information

  # Table Name: q_tagships
  #
  # question_id     :integer
  # hashtag_id      :integer
  validates_uniqueness_of :hashtag_id, :scope => :question_id


  belongs_to :hashtag
  belongs_to :question
end
