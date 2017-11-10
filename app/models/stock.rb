class Stock < ApplicationRecord
  belongs_to :category
  has_many :items

  def self.search(term)
    where("name_item ILIKE ?", "%#{term}%")
    where("barcode LIKE ?", "%#{term}%")
  end
end
