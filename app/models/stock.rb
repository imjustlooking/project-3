require 'elasticsearch/model'

class Stock < ApplicationRecord
  searchkick
  belongs_to :category
  has_many :items
  scope :fruit_type, -> { where ('category_id = 1')}
  scope :category_type, -> category_id { where(:category_id => category_id)}

  def self.search(term)
    if term
      where("name_item || barcode ILIKE ?", "%#{term}%")
    else
      all
    end
  end

end
