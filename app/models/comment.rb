class Comment < ApplicationRecord
  belong_to :user, :post
end