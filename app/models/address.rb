class Address < ActiveRecord::Base
  validates :city, :state, :zip, :street, presence: true
  has_many :user_addresses
  has_many :users, through: :user_addresses


  scope :billing, -> { where(billing: true) }
  scope :delivery, -> { where(shipping: true) }
end
