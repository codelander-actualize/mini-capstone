class Order < ApplicationRecord
	belongs_to :user
	has_many :carted_products
	has_many :products, through: :carted_products

	def update_totals
		subtotal = 0
		carted_products.each do |carted_product|
			subtotal += carted_product.product.price * carted_product.quantity
		end

		self.subtotal = subtotal
		self.tax = subtotal * 0.09
		self.total = subtotal + tax
		self.save
	end
end
