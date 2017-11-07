class Shoppinglist < ApplicationRecord
  belongs_to :user_id
  has_many :items
end
