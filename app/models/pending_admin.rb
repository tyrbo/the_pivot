class PendingAdmin < ActiveRecord::Base
  belongs_to :user
  belongs_to :supplier

  delegate :full_name, to: :user
  delegate :email, to: :user
end
