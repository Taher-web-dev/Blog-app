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
  lockbox_encrypts :private_api_key
  blind_index :private_api_key
  before_create :set_private_api_key
  validates :private_api_key, uniqueness: true, allow_blank: true
  def three_recents_posts
    posts.order(created_at: :desc).limit(3)
  end

  def is?(requested_role)
    role == requested_role.to_s
  end
  private
  def set_private_api_key
    self.private_api_key = SecureRandom.hex if self.private_api_key.nil?
  end
end
