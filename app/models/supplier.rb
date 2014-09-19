class Supplier < ActiveRecord::Base
  has_attached_file :picture, styles: { :medium => "300x300#", :thumb => "32x32#" }, default_url: "red_cross.jpg"
  validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/
  validates :name, presence: true
  validates :url, presence: true

  has_many :suppliers_users
  has_many :users, through: :suppliers_users
  has_many :items
  has_many :sub_orders

  extend FriendlyId
  friendly_id :url, use: [:finders]
  #
  # def self.admins
  #   self.all.map do |supplier|
  #     supplier.suppliers_users.default.map do |suppliers_user|
  #       suppliers_user.user
  #     end
  #   end.flatten.compact
  # end
end
