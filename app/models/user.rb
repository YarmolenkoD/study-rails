class User < ApplicationRecord
  has_many :friend_requests, dependent: :destroy
  has_many :pending_friends, through: :friend_requests, source: :friend
  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def remove_friend(friend)
    current_user.friends.destroy(friend)
  end

  scope :search, ->(search) {
    where("first_name like ? or last_name like ?", "%#{search}%", "%#{search}%").all
    # search = search.split(' ')
    # condition =
    # conditions = conditions.delete_if {|key, value| value.blank?}
    # find(:all, conditions: conditions)
    # where("title like ?", "%#{query}%'") unless query.blank?
  }
end
