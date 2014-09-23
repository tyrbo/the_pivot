class Category < ActiveRecord::Base
  has_many :categorizations
  has_many :items, :through => :categorizations

  validates :name, presence: true

  def item_titles
    items.join(", ")
  end

  def item_titles=(items_string)
    item_titles         = items_string.split(",").collect{ |s| s.strip}.uniq
    new_or_found_items 	= item_titles.collect {|title| Item.find_or_create_by(title: title) }
    self.items     			= new_or_found_items
  end

  def to_s
    name
  end

  def has_active_items?
    items.any? { |item| !item.retire }
  end

  def has_inactive_items?
    items.any? { |item| item.retire }
  end
end
