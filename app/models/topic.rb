class Topic < ApplicationRecord
  belongs_to :user
  belongs_to :category
  belongs_to :age
end
