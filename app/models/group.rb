class Group < ApplicationRecord
  has_many :group_users
  has_many :users, through: :group_users
  has_many :chats

  validates :name, presence: true

  accepts_nested_attributes_for :users
end
