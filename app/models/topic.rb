class Topic < ApplicationRecord
  belongs_to :user
  belongs_to :category
  belongs_to :age
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  def self.search_for(content, method)
    if method == "perfect"
      Topic.where(name: content)
    else
      Topic.where("name LIKE ?", "%" + content + "%")
    end
  end


end
