class Item < ApplicationRecord
 	belongs_to :user
	serialize :tagNum
	received = "hello"
end
