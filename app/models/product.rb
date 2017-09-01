class Product < ApplicationRecord
  belongs_to :user
validates :quantity, presence: true,
 length: { minimum: 1, maximum: 1 }
 validates_numericality_of :quantity, :on => :create, :message => "is not a number"
  def self.search(search)
		if search
			where("tag LIKE ? OR status LIKE ?", "%#{search}%", "%#{search}%")
		else
			Product.all
		end
	end
end
