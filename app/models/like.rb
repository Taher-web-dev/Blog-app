class Like < ApplicationRecord
  belong_to :user, :post
end