class Supplier < ActiveRecord::Base
  validates :name, presence: true
  validates :url, presence: true

  has_many :suppliers_users
  has_many :users, through: :suppliers_users
  has_many :items
end
