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

require 'test_helper'

class QTagshipTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
