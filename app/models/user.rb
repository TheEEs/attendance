class User < ApplicationRecord
  include Clearance::User
  has_many :conferences, inverse_of: :user
end
