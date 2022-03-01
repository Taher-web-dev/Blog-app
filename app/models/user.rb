class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :posts
  has_many :comments
  has_many :likes
  validates :name, presence: true
  validates :posts_counter, numericality: { greater_than_or_equal_to: 0 }
  Roles = [:admin, :default]
  def three_recents_posts
    posts.order(created_at: :desc).limit(3)
  end

  def is?(requested_role)
    self.role == requested_role.to_s
  end
end
