class Product < ApplicationRecord

	validates :name, presence: true, uniqueness: true
	validates :price, numericality: { greater_than: 0 }
	# validates :description, length: { in: 20..500 }
	has_many :carted_products
	has_many :orders, through: :carted_products

	has_many :category_products
	has_many :categories, through: :category_products

	belongs_to :supplier
	has_many :images

	def is_discounted?
		price <= 10
	end

	def tax
		price * 0.09
	end

	def total
		price + tax
	end

	def category_names
		categories.map { |category| category.name }
	end

end
