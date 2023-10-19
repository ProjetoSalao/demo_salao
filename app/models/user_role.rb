class UserRole < ApplicationRecord
  acts_as_tenant :tenant
end
