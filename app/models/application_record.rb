class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def is_upvoted?(user)
    self.upvoted_users.include?(user)
  end
end
