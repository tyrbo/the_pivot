FactoryGirl.define do
  factory :sub_order do

    status Order::Status::ORDERED
  end
end
