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

  before_update :convert_to_cents
  before_create :convert_to_cents

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
    '$' + sprintf("%.2f", price.to_d / 100.00)
    price
  end

  def self.search(search)
    search = search.downcase
    where("title like lower(?) or description like lower(?)", "%#{search}%", "%#{search}%")
  end

  def convert_to_cents
    self.price = (price * 100).to_i
  end

  def edit_price
    format_price.gsub('$', '')
  end
end
