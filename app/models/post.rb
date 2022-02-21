class Post < ApplicationRecord
  belong_to :user
  has_many :comments, :like
end