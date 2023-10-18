FactoryBot.define do
  factory :user_role do
    name { "MyString" }
    tenant { nil }
    canCreateShop { false }
  end
end
