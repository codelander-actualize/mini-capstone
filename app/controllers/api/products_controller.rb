class Api::ProductsController < ApplicationController

	def all_products_method
		@products = Product.all #array of hashes
		render 'all_products.json.jbuilder'
	end

	def first_product_method
		@product = Product.first
		render 'first_product.json.jbuilder'
	end

	def second_product_method
		@product = Product.second
		render 'second_product.json.jbuilder'
	end

end
