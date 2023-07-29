class Product < ApplicationRecord
  acts_as_tenant :tenant
end
