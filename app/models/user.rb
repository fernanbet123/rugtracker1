class User < ApplicationRecord
	has_many :items, dependent: :destroy
	has_many :products, dependent: :destroy
	accepts_nested_attributes_for :items
	validates :phoneNum, presence: true,
 length: { minimum: 10, maximum: 10 }
 validates_numericality_of :phoneNum, :on => :create, :message => "is not a number"
 validates :firstName, presence: true, length: {minimum: 2}
 validates :lastName, presence: true, length: {minimum: 2}
 User.order(:firstName)
	# def self.search(search)
	# 	@user = User.find(firstName = search)
	# end
	def self.search(search)
		if search
			where("lastName LIKE ? OR firstName LIKE ? OR email LIKE ? OR phoneNum LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
		else
			User.all
		end
	end
end