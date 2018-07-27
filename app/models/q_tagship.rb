class QTagship < ApplicationRecord

  #== schema Information

  # Table Name: q_tagships
  #
  # question_id     :integer
  # hashtag_id      :integer

  belongs_to :hashtag
  belongs_to :question
end
