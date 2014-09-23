class SuppliersUser < ActiveRecord::Base
  belongs_to :user
  belongs_to :supplier

  scope :enabled, -> { where(role: 'supplier') }
  scope :pending, -> { where(role: 'pending') }
end
