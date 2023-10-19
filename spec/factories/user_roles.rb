FactoryBot.define do
  factory :user_role do
    id = 1
    name =  'Admin'
    tenant_id =  1
    canCreateShop = true
  end
end
