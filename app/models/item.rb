class Item < ActiveRecord::Base
  has_attached_file :picture, styles: { :medium => "200x200#", :thumb => "50x50#", :small => '128x128#' }, default_url: "red_cross.jpg"
  validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/

  validates :title,       presence: true, uniqueness: true
  validates :description, presence: true
  validates :description, length: { in: 2..500 }

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
  end

  def self.search(search)
    search = search.downcase
    where("lower(title) like ? or lower(description) like ?", "%#{search}%", "%#{search}%")
  end

  def convert_to_cents
      self.price = (price * 100).to_i
  end

  def edit_price
    format_price.gsub('$', '')
  end

  def self.active(supplier)
    where(retire: false, supplier: supplier)
  end

  def self.inactive(supplier)
    where(retire: true, supplier: supplier)
  end

  def update_retired_attribute
    retire ? update_column(:retire, false) : update_column(:retire, true)
  end

  def out_of_stock?
    inventory <= 0
  end
end
