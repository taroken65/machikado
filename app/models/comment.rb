class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :topic

  def self.search(keyword)
  where(["comment like?", "%#{keyword}%"])
  end

end
