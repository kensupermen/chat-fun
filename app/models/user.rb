class User < ApplicationRecord
  has_secure_password
  
  has_many :received_messages, class_name: "Message", foreign_key: "recipient_id"
  has_many :sent_messages, class_name: "Message", foreign_key: "sender_id"

  has_many :relationships, foreign_key: "user_id", class_name: 'Relationship'
  has_many :request_relationships, foreign_key: "friend_id", class_name: 'Relationship'

  has_many :friends, through: :relationships
  has_many :request_targets, through: :request_relationships, source: :user


  validates :email, uniqueness: true
  validates :name, presence: true

  def to_s
    email
  end

  def lastest_received_messages(n)
    received_messages.order(created_at: :desc).limit(n)
  end

  def unread_messages
    received_message.where(read_at: nil)
  end

  def send_friend_request(friend_id)
    friend = User.find_by_id(friend_id)
    relationship = Relationship.create user: self, friend: friend, status: "pending"
  end

  def accept_friend_request(friend_id)
    friend = User.find_by_id(friend_id) 
    friend.relationships.where(friend_id: self.id).update(status: "accepted")
  end

end
