class Topic < ApplicationRecord
  belongs_to :user
  belongs_to :category
  belongs_to :age
  has_many :comments, dependent: :destroy
end
