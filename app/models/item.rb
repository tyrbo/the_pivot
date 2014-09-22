class Item < ActiveRecord::Base
  has_attached_file :picture, styles: { :medium => "300x300#", :thumb => "32x32#" }, default_url: "red_cross.jpg"
  validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/

  validates :title,       presence: true, uniqueness: true
  validates :description, presence: true

  has_many  :categorizations
  has_many  :categories, through: :categorizations

  has_many  :order_items
  has_many  :orders, through: :order_items

  has_many  :cart_items
  has_many  :carts, through: :cart_items

  belongs_to :supplier

  scope :not_retired, -> { where(retire: 'false') }
  scope :not_retired_too, -> { where(retire: 'f') }
  scope :retired, -> { where(retire: 't') }

  def category_names
    categories.join(", ")
  end

  def categories_list(category_list)
    if category_list
      self.categories = category_list
    end
  end

  def to_s
    title
  end

  def format_price
    '$' + sprintf("%.2f", price / 100.00)
  end


  def self.search(search)
    where("title like ? or description like ?", "%#{search}%", "%#{search}%")
  end
end
