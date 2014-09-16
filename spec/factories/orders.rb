FactoryGirl.define do
  factory :order do
    order_total 25.55
    order_type 'pick-up'
    order_status Order::Status::ORDERED
  end
end
