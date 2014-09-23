class FeaturedSupplier < ActiveRecord::Base
  belongs_to :supplier

  def self.update
    FeaturedSupplier.destroy_all
    Supplier.limit(3).order('RANDOM()').each do |supplier|
      FeaturedSupplier.create(supplier: supplier)
    end
  end
end
