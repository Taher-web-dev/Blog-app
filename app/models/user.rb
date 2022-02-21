class User < ApplicationRecord
  has_many :posts, :comments, :like
end