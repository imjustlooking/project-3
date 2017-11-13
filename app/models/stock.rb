class Stock < ApplicationRecord
  belongs_to :category
  has_many :items

  # def upload
  #   uploaded_io = params[:stock][:img]
  #   File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'wb') do |file|
  #     file.write(uploaded_io.read)
  #   end
  # end

  def self.search(term)
    if term
      where("name_item || barcode ILIKE ?", "%#{term}%")
    else
      all
    end
  end

end
