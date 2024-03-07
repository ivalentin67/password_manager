class Password < ApplicationRecord
  has_many :user_passwords, dependent: :destroy
  has_many :user, through: :user_passwords

  encrypts :username, deterministic: true
  encrypts :password

  validates :url, presence: true
  validates :username, presence: true
  validates :password, presence: true

  def shareable_users
    User.excluding(user)
  end
end