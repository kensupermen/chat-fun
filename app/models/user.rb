class User < ApplicationRecord
  has_secure_password
  
  has_many :received_messages, class_name: "Message", foreign_key: "recipient_id"
  has_many :sent_messages, class_name: "Message", foreign_key: "sender_id"

  validates :email, uniqueness: true
  validates :name, presence: true

  def to_s
    email
  end

  def unread_messages
    received_message.where(read_at: nil)
  end
end
