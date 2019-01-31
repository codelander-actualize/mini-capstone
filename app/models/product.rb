class Product < ApplicationRecord

	validates :name, presence: true, uniqueness: true
	validates :price, numericality: { greater_than: 0 }
	# validates :description, length: { in: 20..500 }

	has_many :category_products
	has_many :categories, through: :category_products

	belongs_to :supplier
	has_many :images
	has_many :orders

	def is_discounted?
		price <= 10
	end

	def tax
		price * 0.09
	end

	def total
		price + tax
	end

end
