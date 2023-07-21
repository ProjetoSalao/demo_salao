class Shop < ApplicationRecord
  acts_as_tenant :tenant
end
