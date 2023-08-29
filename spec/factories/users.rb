FactoryBot.define do
  factory :user do
    email {FFaker::Internet.email }
    password {Devise.friendly_token.first(8)}
    tenant_id = 1
    admin { true }
  end
end