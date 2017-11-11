class Stock < ApplicationRecord
  belongs_to :category
  has_many :items

  def self.search(term)
    if term
      where("name_item || barcode ILIKE ?", "%#{term}%")
    else
      all
    end
  end

end
